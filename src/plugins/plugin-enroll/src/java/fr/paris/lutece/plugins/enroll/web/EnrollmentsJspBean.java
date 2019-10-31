package fr.paris.lutece.plugins.enroll.web;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import fr.paris.lutece.plugins.enroll.business.Project;
import fr.paris.lutece.plugins.enroll.business.ProjectFilter;
import fr.paris.lutece.plugins.enroll.business.enrollment.Enrollment;
import fr.paris.lutece.plugins.enroll.business.enrollment.EnrollmentHome;
// import fr.paris.lutece.plugins.genericattributes.business.Entry;
// import fr.paris.lutece.plugins.genericattributes.business.EntryHome;
// import fr.paris.lutece.plugins.genericattributes.business.GenericAttributeError;
// import fr.paris.lutece.plugins.genericattributes.business.Response;
// import fr.paris.lutece.plugins.workflowcore.business.state.State;
// import fr.paris.lutece.plugins.workflowcore.business.state.StateFilter;
// import fr.paris.lutece.plugins.workflowcore.service.state.StateService;
// import fr.paris.lutece.plugins.workflowcore.service.task.ITask;
// import fr.paris.lutece.plugins.workflowcore.service.task.ITaskService;
// import fr.paris.lutece.plugins.workflowcore.service.task.TaskService;
// import fr.paris.lutece.portal.business.file.FileHome;
import fr.paris.lutece.portal.business.user.AdminUser;
import fr.paris.lutece.portal.service.admin.AccessDeniedException;
import fr.paris.lutece.portal.service.message.AdminMessage;
import fr.paris.lutece.portal.service.message.AdminMessageService;
import fr.paris.lutece.portal.service.message.SiteMessageException;
import fr.paris.lutece.portal.service.rbac.RBACService;
import fr.paris.lutece.portal.service.security.LuteceUser;
import fr.paris.lutece.portal.service.security.SecurityService;
import fr.paris.lutece.portal.service.spring.SpringContextService;
import fr.paris.lutece.portal.service.template.AppTemplateService;
import fr.paris.lutece.portal.service.util.AppLogService;
import fr.paris.lutece.portal.service.util.AppPathService;
import fr.paris.lutece.portal.service.util.AppPropertiesService;
import fr.paris.lutece.portal.service.workflow.WorkflowService;
import fr.paris.lutece.portal.util.mvc.admin.MVCAdminJspBean;
import fr.paris.lutece.portal.util.mvc.admin.annotations.Controller;
import fr.paris.lutece.portal.util.mvc.commons.annotations.Action;
import fr.paris.lutece.portal.util.mvc.commons.annotations.View;
import fr.paris.lutece.portal.util.mvc.utils.MVCUtils;
import fr.paris.lutece.portal.web.util.LocalizedPaginator;
import fr.paris.lutece.util.html.HtmlTemplate;
import fr.paris.lutece.util.html.Paginator;
import fr.paris.lutece.util.url.UrlItem;

/**
 * @author Evan Hsia
 */
@Controller( controllerJsp = "ManageEnrollments.jsp", controllerPath = "jsp/admin/plugins/enroll", right = "ENROLL_MANAGEMENT" )
public class EnrollmentsJspBean extends ManageEnrollJspBean
{
  // Templates
  private static final String TEMPLATE_MANAGE_ENROLLMENTS = "/admin/plugins/enroll/manage_enrollments.html";
  private static final String TEMPLATE_CREATE_ENROLLMENT = "/admin/plugins/enroll/create_enrollment.html";
  private static final String TEMPLATE_MODIFY_ENROLLMENT = "/admin/plugins/enroll/modify_enrollment.html";

  // Properties for page titles
  private static final String PROPERTY_PAGE_TITLE_MANAGE_ENROLLMENTS = "enroll.manage_enrollments.pageTitle";
  private static final String PROPERTY_PAGE_TITLE_MODIFY_ENROLLMENT = "enroll.modify_enrollment.pageTitle";
  private static final String PROPERTY_PAGE_TITLE_CREATE_ENROLLMENT = "enroll.create_enrollment.pageTitle";

  // Markers
  private static final String MARK_ENROLLMENT_LIST = "enrollment_list";
  private static final String MARK_ENROLLMENT = "enrollment";

  private static final String JSP_MANAGE_ENROLLMENTS = "jsp/admin/plugins/enroll/ManageEnrollments.jsp";

  // Properties
  private static final String MESSAGE_CONFIRM_REMOVE_ENROLLMENT = "enroll.message.confirmRemoveEnrollment";

  // Validations
  private static final String VALIDATION_ATTRIBUTES_PREFIX = "enroll.model.entity.enrollment.attribute.";

  // Views
  private static final String VIEW_MANAGE_ENROLLMENTS = "manageEnrollments";
  private static final String VIEW_VIEW_ENROLLMENT = "viewEnrollment";

  // Actions
  private static final String ACTION_REMOVE_ENROLLMENT = "removeEnrollment";
  private static final String ACTION_REMOVE_MASSENROLLMENT = "removeMassEnrollment";
  private static final String ACTION_CONFIRM_REMOVE_ENROLLMENT = "confirmRemoveEnrollment";
  private static final String ACTION_CONFIRM_REMOVE_MASS_ENROLLMENT = "confirmRemoveMassEnrollment";

  // Infos
  private static final String INFO_ENROLLMENT_CREATED = "enroll.info.enrollment.created";
  private static final String INFO_ENROLLMENT_UPDATED = "enroll.info.enrollment.updated";
  private static final String INFO_ENROLLMENT_REMOVED = "enroll.info.enrollment.removed";

  // Session variable to store working values
  private Enrollment _enrollment;

  /**
     * Get the page to manage enrollments
     *
     * @param request
     *            The request
     * @return The HTML code to display
     */
    @SuppressWarnings( "unchecked" )
    @View( value = VIEW_MANAGE_ENROLLMENTS, defaultView = true )
    public String getManageEnrollments( HttpServletRequest request )
    {
        // // Clean session
        // enrollmentAsynchronousUploadHandler.getHandler( ).removeSessionFiles( request.getSession( ).getId( ) );
        // request.getSession( ).removeAttribute( SESSION_NOT_VALIDATED_ENROLLMENT );
        // request.getSession( ).removeAttribute( SESSION_VALIDATED_ENROLLMENT );

        // String strIdForm = request.getParameter( PARAMETER_ID_FORM );
        // int nIdForm = Integer.parseInt( strIdForm );
        // // If it is a new search
        // if ( request.getParameter( PARAMETER_RESET ) != null )
        // {
        //     request.getSession( ).removeAttribute( SESSION_ENROLLMENT_FILTER );
        //     request.getSession( ).removeAttribute( SESSION_LIST_ENROLLMENTS );
        // }
        // // Get the enrollment filter in session
        // ProjectFilter filter = (ProjectFilter) request.getSession( ).getAttribute( SESSION_ENROLLMENT_FILTER );
        // if ( filter == null )
        // {
        //     filter = new ProjectFilter( );
        //     filter.setIdForm( nIdForm );
        //     // if we come from the calendar, need to get the starting and ending
        //     // time of the slot
        //     String strStartingDateTime = request.getParameter( PARAMETER_STARTING_DATE_TIME );
        //     String strEndingDateTime = request.getParameter( PARAMETER_ENDING_DATE_TIME );
        //     if ( strStartingDateTime != null && strEndingDateTime != null )
        //     {
        //         LocalDateTime startingDateTime = LocalDateTime.parse( strStartingDateTime );
        //         LocalDateTime endingDateTime = LocalDateTime.parse( strEndingDateTime );
        //         filter.setStartingDateOfSearch( Date.valueOf( startingDateTime.toLocalDate( ) ) );
        //         filter.setStartingTimeOfSearch( startingDateTime.toLocalTime( ).toString( ) );
        //         filter.setEndingDateOfSearch( Date.valueOf( endingDateTime.toLocalDate( ) ) );
        //         filter.setEndingTimeOfSearch( endingDateTime.toLocalTime( ).toString( ) );
        //     }
        //     request.getSession( ).setAttribute( SESSION_ENROLLMENT_FILTER, filter );
        // }
        // // Get the list in session
        // // If it is an order by or a navigation page, no need to search again
        // List<enrollmentDTO> listenrollmentsDTO = (List<enrollmentDTO>) request.getSession( ).getAttribute( SESSION_LIST_ENROLLMENTS );
        // // If it is a new search
        // if ( request.getParameter( PARAMETER_SEARCH ) != null )
        // {
        //     // Populate the filter
        //     populate( filter, request );
        //     listenrollmentsDTO = enrollmentService.findListenrollmentsDTOByFilter( filter ).stream( )
        //             .sorted( ( a1, a2 ) -> Integer.compare( a1.getIdenrollment( ), a2.getIdenrollment( ) ) ).collect( Collectors.toList( ) );
        // }
        // // If it is an order by
        // String strOrderBy = request.getParameter( PARAMETER_ORDER_BY );
        // String strOrderAsc = request.getParameter( PARAMETER_ORDER_ASC );
        // listenrollmentsDTO = orderList( listenrollmentsDTO, strOrderBy, strOrderAsc );
        // if ( StringUtils.isNotEmpty( request.getParameter( PARAMETER_DELETE_AND_BACK ) ) )
        // {
        //     String [ ] tabIdenrollmentToDelete = request.getParameterValues( PARAMETER_ID_ENROLLMENT_DELETE );
        //     if ( tabIdenrollmentToDelete != null )
        //     {
        //         request.getSession( ).setAttribute( PARAMETER_ID_ENROLLMENT_DELETE, tabIdenrollmentToDelete );
        //         return getConfirmRemoveMassenrollment( request, nIdForm );
        //     }
        // }
        // String strCurrentPageIndex = Paginator.getPageIndex( request, Paginator.PARAMETER_PAGE_INDEX,
        //         (String) request.getSession( ).getAttribute( SESSION_CURRENT_PAGE_INDEX ) );
        // if ( strCurrentPageIndex == null )
        // {
        //     strCurrentPageIndex = DEFAULT_CURRENT_PAGE;
        // }
        // request.getSession( ).setAttribute( SESSION_CURRENT_PAGE_INDEX, strCurrentPageIndex );
        // int nItemsPerPage = Paginator.getItemsPerPage( request, Paginator.PARAMETER_ITEMS_PER_PAGE,
        //         getIntSessionAttribute( request.getSession( ), SESSION_ITEMS_PER_PAGE ), _nDefaultItemsPerPage );
        // request.getSession( ).setAttribute( SESSION_ITEMS_PER_PAGE, nItemsPerPage );
        //
        // UrlItem url = new UrlItem( JSP_MANAGE_ENROLLMENTS );
        // url.addParameter( MVCUtils.PARAMETER_VIEW, VIEW_MANAGE_ENROLLMENTS );
        // url.addParameter( PARAMETER_ID_FORM, strIdForm );
        // String strUrl = url.getUrl( );
        // if ( listenrollmentsDTO == null )
        // {
        //     listenrollmentsDTO = enrollmentService.findListenrollmentsDTOByFilter( filter ).stream( )
        //             .sorted( ( a1, a2 ) -> Integer.compare( a1.getIdenrollment( ), a2.getIdenrollment( ) ) ).collect( Collectors.toList( ) );
        // }
        // request.getSession( ).setAttribute( SESSION_LIST_ENROLLMENTS, listenrollmentsDTO );
        // LocalizedPaginator<enrollmentDTO> paginator = new LocalizedPaginator<enrollmentDTO>( listenrollmentsDTO, nItemsPerPage, strUrl,
        //         PARAMETER_PAGE_INDEX, strCurrentPageIndex, getLocale( ) );
        // enrollmentForm form = FormService.buildenrollmentFormLight( nIdForm );
        // Map<String, Object> model = getModel( );
        // model.put( MARK_FORM, form );
        // model.put( MARK_FORM_MESSAGES, FormMessageService.findFormMessageByIdForm( nIdForm ) );
        // model.put( MARK_NB_ITEMS_PER_PAGE, Integer.toString( nItemsPerPage ) );
        // model.put( MARK_PAGINATOR, paginator );
        // model.put( MARK_LANGUAGE, getLocale( ) );
        // model.put( MARK_ACTIVATE_WORKFLOW, ACTIVATEWORKFLOW );
        // if ( ( form.getIdWorkflow( ) > 0 ) && WorkflowService.getInstance( ).isAvailable( ) )
        // {
        //     int nIdWorkflow = form.getIdWorkflow( );
        //     StateFilter stateFilter = new StateFilter( );
        //     stateFilter.setIdWorkflow( nIdWorkflow );
        //     for ( enrollmentDTO enrollment : paginator.getPageItems( ) )
        //     {
        //         State stateenrollment = _stateService.findByResource( enrollment.getIdenrollment( ), enrollment.enrollment_RESOURCE_TYPE, nIdWorkflow );
        //         if ( stateenrollment != null )
        //         {
        //             enrollment.setState( stateenrollment );
        //         }
        //         enrollment.setListWorkflowActions( WorkflowService.getInstance( ).getActions( enrollment.getIdenrollment( ),
        //                 enrollment.enrollment_RESOURCE_TYPE, form.getIdWorkflow( ), getUser( ) ) );
        //     }
        // }
        // AdminUser user = getUser( );
        // model.put( MARK_ENROLLMENT_LIST, paginator.getPageItems( ) );
        // model.put( MARK_FILTER, filter );
        // model.put( MARK_RIGHT_CREATE,
        //         RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_CREATE_ENROLLMENT, user ) );
        // model.put( MARK_RIGHT_MODIFY,
        //         RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_MODIFY_ENROLLMENT, user ) );
        // model.put( MARK_RIGHT_DELETE,
        //         RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_DELETE_ENROLLMENT, user ) );
        // model.put( MARK_RIGHT_VIEW,
        //         RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_VIEW_ENROLLMENT, user ) );
        // model.put( MARK_RIGHT_CHANGE_STATUS,
        //         RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_CHANGE_ENROLLMENT_STATUS, user ) );
        _enrollment = null;
        List<Enrollment> listEnrollments = EnrollmentHome.getEnrollmentsList(  );
        Map<String, Object> model = getPaginatedListModel( request, MARK_ENROLLMENT_LIST, listEnrollments, JSP_MANAGE_ENROLLMENTS );
        return getPage( PROPERTY_PAGE_TITLE_MANAGE_ENROLLMENTS, TEMPLATE_MANAGE_ENROLLMENTS, model );
    }

    // /**
    //  * Manages the removal form of a enrollment whose identifier is in the HTTP request
    //  *
    //  * @param request
    //  *            The HTTP request
    //  * @return the HTML code to confirm
    //  */
    // @Action( ACTION_CONFIRM_ENROLLMENT )
    // public String getConfirmRemoveEnrollment( HttpServletRequest request )
    // {
    //     UrlItem url = new UrlItem( getActionUrl( ACTION_REMOVE_ENROLLMENT ) );
    //     url.addParameter( PARAMETER_ID_ENROLLMENT, request.getParameter( PARAMETER_ID_ENROLLMENT ) );
    //     url.addParameter( PARAMETER_ID_FORM, request.getParameter( PARAMETER_ID_FORM ) );
    //     String strMessageUrl = AdminMessageService.getMessageUrl( request, MESSAGE_CONFIRM_REMOVE_ENROLLMENT, url.getUrl( ), AdminMessage.TYPE_CONFIRMATION );
    //     return redirect( request, strMessageUrl );
    // }
    //
    // /**
    //  * Handles the removal form of a enrollment
    //  *
    //  * @param request
    //  *            The HTTP request
    //  * @return the JSP URL to display the form to manage enrollments
    //  * @throws AccessDeniedException
    //  *             If the user is not authorized to access this feature
    //  */
    // @SuppressWarnings( {
    //     "unchecked"
    // } )
    // @Action( ACTION_REMOVE_ENROLLMENT )
    // public String doRemoveEnrollment( HttpServletRequest request ) throws AccessDeniedException
    // {
    //     int nIdenrollment = Integer.parseInt( request.getParameter( PARAMETER_ID_ENROLLMENT ) );
    //     Integer idForm = Integer.parseInt( request.getParameter( PARAMETER_ID_FORM ) );
    //     enrollmentService.deleteenrollment( nIdenrollment, getUser( ) );
    //     AppLogService.info( LogUtilities.buildLog( ACTION_REMOVE_ENROLLMENT, Integer.toString( nIdenrollment ), getUser( ) ) );
    //     addInfo( INFO_ENROLLMENT_REMOVED, getLocale( ) );
    //     // Need to update the list of the enrollments in session
    //     List<enrollmentDTO> listenrollmentsDTO = (List<enrollmentDTO>) request.getSession( ).getAttribute( SESSION_LIST_ENROLLMENTS );
    //     if ( listenrollmentsDTO != null )
    //     {
    //         listenrollmentsDTO = listenrollmentsDTO.stream( ).filter( a -> a.getIdenrollment( ) != nIdenrollment ).collect( Collectors.toList( ) );
    //         request.getSession( ).setAttribute( SESSION_LIST_ENROLLMENTS, listenrollmentsDTO );
    //     }
    //     return redirect( request, VIEW_MANAGE_ENROLLMENTS, PARAMETER_ID_FORM, idForm );
    // }
    //
    // /**
    //  * Manages the removal form of a enrollment whose identifier is in the HTTP request
    //  *
    //  * @param request
    //  *            The HTTP request
    //  * @return the HTML code to confirm
    //  */
    // @Action( ACTION_CONFIRM_REMOVE_MASS_ENROLLMENT )
    // public String getConfirmRemoveMassEnrollment( HttpServletRequest request, int nIdForm )
    // {
    //     UrlItem url = new UrlItem( getActionUrl( ACTION_REMOVE_MASSenrollment ) );
    //     url.addParameter( PARAMETER_ID_FORM, nIdForm );
    //     String strMessageUrl = AdminMessageService.getMessageUrl( request, MESSAGE_CONFIRM_REMOVE_MASSenrollment, url.getUrl( ),
    //             AdminMessage.TYPE_CONFIRMATION );
    //     return redirect( request, strMessageUrl );
    // }
    //
    // /**
    //  * Handles the removal form of a enrollment
    //  *
    //  * @param request
    //  *            The HTTP request
    //  * @return the JSP URL to display the form to manage enrollments
    //  * @throws AccessDeniedException
    //  *             If the user is not authorized to access this feature
    //  */
    // @SuppressWarnings( "unchecked" )
    // @Action( ACTION_REMOVE_MASSENROLLMENT )
    // public String doRemoveMassEnrollment( HttpServletRequest request ) throws AccessDeniedException
    // {
    //     String [ ] tabIdenrollmentToDelete = (String [ ]) request.getSession( ).getAttribute( PARAMETER_ID_ENROLLMENT_DELETE );
    //     request.getSession( ).removeAttribute( PARAMETER_ID_ENROLLMENT_DELETE );
    //     Integer idForm = Integer.parseInt( request.getParameter( PARAMETER_ID_FORM ) );
    //     ArrayList<String> listStringIdenrollment = new ArrayList<>( );
    //     if ( tabIdenrollmentToDelete != null )
    //     {
    //         for ( String strIdenrollment : tabIdenrollmentToDelete )
    //         {
    //             enrollmentService.deleteenrollment( Integer.valueOf( strIdenrollment ), getUser( ) );
    //             AppLogService.info( LogUtilities.buildLog( ACTION_REMOVE_ENROLLMENT, strIdenrollment, getUser( ) ) );
    //         }
    //         addInfo( INFO_ENROLLMENT_MASSREMOVED, getLocale( ) );
    //         listStringIdenrollment.addAll( Arrays.asList( tabIdenrollmentToDelete ) );
    //     }
    //     // Need to update the list of the enrollments in session
    //     List<enrollmentDTO> listenrollmentsDTO = (List<enrollmentDTO>) request.getSession( ).getAttribute( SESSION_LIST_ENROLLMENTS );
    //     if ( listenrollmentsDTO != null )
    //     {
    //         listenrollmentsDTO = listenrollmentsDTO.stream( ).filter( a -> !listStringIdenrollment.contains( Integer.toString( a.getIdenrollment( ) ) ) )
    //                 .collect( Collectors.toList( ) );
    //         request.getSession( ).setAttribute( SESSION_LIST_ENROLLMENTS, listenrollmentsDTO );
    //     }
    //     return redirect( request, VIEW_MANAGE_ENROLLMENTS, PARAMETER_ID_FORM, idForm );
    // }
    //
    // /**
    //  * View details of an enrollment
    //  *
    //  * @param request
    //  *            The request
    //  * @return The HTML content to display
    //  * @throws AccessDeniedException
    //  *             If the user is not authorized to access this feature
    //  */
    // @View( VIEW_VIEW_ENROLLMENT )
    // public String getViewEnrollment( HttpServletRequest request ) throws AccessDeniedException
    // {
    //     String strIdenrollment = request.getParameter( PARAMETER_ID_ENROLLMENT );
    //     String strIdForm = request.getParameter( PARAMETER_ID_FORM );
    //     int nIdForm = Integer.parseInt( strIdForm );
    //     Form form = FormService.findFormLightByPrimaryKey( nIdForm );
    //     int nItemsPerPage = Paginator.getItemsPerPage( request, Paginator.PARAMETER_ITEMS_PER_PAGE,
    //             getIntSessionAttribute( request.getSession( ), SESSION_ITEMS_PER_PAGE ), _nDefaultItemsPerPage );
    //     int nIdenrollment = Integer.parseInt( strIdenrollment );
    //     enrollmentDTO enrollmentDTO = enrollmentService.buildenrollmentDTOFromIdenrollment( nIdenrollment );
    //     if ( !RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_VIEW_ENROLLMENT, getUser( ) ) )
    //     {
    //         throw new AccessDeniedException( enrollmentResourceIdService.PERMISSION_VIEW_ENROLLMENT );
    //     }
    //     Map<String, Object> model = getModel( );
    //     model.put( MARK_ENROLLMENT, enrollmentDTO );
    //     model.put( MARK_FORM_MESSAGES, FormMessageService.findFormMessageByIdForm( nIdForm ) );
    //     model.put( MARK_FORM, form );
    //     model.put( MARK_NB_ITEMS_PER_PAGE, Integer.toString( nItemsPerPage ) );
    //     if ( ( form.getIdWorkflow( ) > 0 ) && WorkflowService.getInstance( ).isAvailable( ) )
    //     {
    //         model.put(
    //                 MARK_RESOURCE_HISTORY,
    //                 WorkflowService.getInstance( ).getDisplayDocumentHistory( nIdenrollment, enrollment.enrollment_RESOURCE_TYPE, form.getIdWorkflow( ),
    //                         request, getLocale( ) ) );
    //     }
    //     if ( ( form.getIdWorkflow( ) > 0 ) && WorkflowService.getInstance( ).isAvailable( ) )
    //     {
    //         int nIdWorkflow = form.getIdWorkflow( );
    //         StateFilter stateFilter = new StateFilter( );
    //         stateFilter.setIdWorkflow( nIdWorkflow );
    //         State stateenrollment = _stateService.findByResource( enrollmentDTO.getIdenrollment( ), enrollment.enrollment_RESOURCE_TYPE, nIdWorkflow );
    //         if ( stateenrollment != null )
    //         {
    //             enrollmentDTO.setState( stateenrollment );
    //         }
    //         enrollmentDTO.setListWorkflowActions( WorkflowService.getInstance( ).getActions( enrollmentDTO.getIdenrollment( ),
    //                 enrollment.enrollment_RESOURCE_TYPE, form.getIdWorkflow( ), getUser( ) ) );
    //     }
    //     Locale locale = getLocale( );
    //     List<Response> listResponse = enrollmentResponseService.findListResponse( nIdenrollment );
    //     for ( Response response : listResponse )
    //     {
    //         if ( response.getFile( ) != null )
    //         {
    //             response.setFile( FileHome.findByPrimaryKey( response.getFile( ).getIdFile( ) ) );
    //         }
    //         if ( response.getEntry( ) != null )
    //         {
    //             response.setEntry( EntryHome.findByPrimaryKey( response.getEntry( ).getIdEntry( ) ) );
    //         }
    //     }
    //     enrollmentDTO.setListResponse( listResponse );
    //     model.put( MARK_LIST_RESPONSE_RECAP_DTO, enrollmentUtilities.buildListResponse( enrollmentDTO, request, locale ) );
    //     model.put( MARK_ADDON, enrollmentAddOnManager.getenrollmentAddOn( enrollmentDTO.getIdenrollment( ), getLocale( ) ) );
    //     AdminUser user = getUser( );
    //     model.put( MARK_RIGHT_CREATE,
    //             RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_CREATE_ENROLLMENT, user ) );
    //     model.put( MARK_RIGHT_MODIFY,
    //             RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_MODIFY_ENROLLMENT, user ) );
    //     model.put( MARK_RIGHT_DELETE,
    //             RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_DELETE_ENROLLMENT, user ) );
    //     model.put( MARK_RIGHT_VIEW,
    //             RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_VIEW_ENROLLMENT, user ) );
    //     model.put( MARK_RIGHT_CHANGE_STATUS,
    //             RBACService.isAuthorized( enrollmentForm.RESOURCE_TYPE, strIdForm, enrollmentResourceIdService.PERMISSION_CHANGE_ENROLLMENT_STATUS, user ) );
    //     model.put( MARK_LANGUAGE, getLocale( ) );
    //     model.put( MARK_ACTIVATE_WORKFLOW, ACTIVATEWORKFLOW );
    //     return getPage( PROPERTY_PAGE_TITLE_VIEW_ENROLLMENT, TEMPLATE_VIEW_ENROLLMENT, model );
    // }
}
