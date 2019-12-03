/*
* Copyright (c) 2002-2016, Mairie de Paris
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*
*  1. Redistributions of source code must retain the above copyright notice
*     and the following disclaimer.
*
*  2. Redistributions in binary form must reproduce the above copyright notice
*     and the following disclaimer in the documentation and/or other materials
*     provided with the distribution.
*
*  3. Neither the name of 'Mairie de Paris' nor 'Lutece' nor the names of its
*     contributors may be used to endorse or promote products derived from
*     this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
* ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
* LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
* CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
* SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
* INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
* CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
* POSSIBILITY OF SUCH DAMAGE.
*
* License 1.0
*/
package fr.paris.lutece.plugins.enroll.rs;

import fr.paris.lutece.plugins.enroll.business.enrollment.Enrollment;
import fr.paris.lutece.plugins.enroll.business.enrollment.EnrollmentHome;
import fr.paris.lutece.plugins.rest.service.RestConstants;
import fr.paris.lutece.util.json.ErrorJsonResponse;
import fr.paris.lutece.util.json.JsonResponse;
import fr.paris.lutece.util.json.JsonUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import java.util.List;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.DELETE;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
* EnrollmentRest
*/
@Path( RestConstants.BASE_PATH + Constants.API_PATH + Constants.VERSION_PATH + Constants.PROJECT_PATH )
public class EnrollmentRest
{
   private static final int VERSION_1 = 1;
   private final Logger _logger = Logger.getLogger( RestConstants.REST_LOGGER );

   /**
    * Get Enrollment List
    * @param nVersion the API version
    * @return the Enrollment List
    */
   @GET
   @Path( StringUtils.EMPTY )
   @Produces( MediaType.APPLICATION_JSON )
   public Response getEnrollmentList( @PathParam( Constants.VERSION ) Integer nVersion )
   {
       switch ( nVersion )
       {
           case VERSION_1:
               return getEnrollmentListV1( );
           default:
               break;
       }
       _logger.error( Constants.ERROR_NOT_FOUND_VERSION );
       return Response.status( Response.Status.NOT_FOUND )
               .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.NOT_FOUND.name( ), Constants.ERROR_NOT_FOUND_VERSION ) ) )
               .build( );
   }

   /**
    * Get Enrollment List V1
    * @return the Enrollment List for the version 1
    */
   private Response getEnrollmentListV1( )
   {
       List<Enrollment> _listEnrollments = EnrollmentHome.getEnrollmentsList( );

       if( _listEnrollments.isEmpty( ) )
       {
           return Response.status( Response.Status.NO_CONTENT )
               .entity( JsonUtil.buildJsonResponse( new JsonResponse( Constants.EMPTY_OBJECT ) ) )
               .build( );
       }
       return Response.status( Response.Status.OK )
               .entity( JsonUtil.buildJsonResponse( new JsonResponse( _listEnrollments ) ) )
               .build( );
   }

   /**
    * Create Enrollment
    * @param nVersion the API version
    * @param name the name
    * @param email the email
    * @param phone the phone
    * @return the Enrollment if created
    */
   @POST
   @Path( StringUtils.EMPTY )
   @Produces( MediaType.APPLICATION_JSON )
   public Response createEnrollment(
   @FormParam( Constants.ENROLLMENT_ATTRIBUTE_PROGRAM ) String enrollment,
   @FormParam( Constants.ENROLLMENT_ATTRIBUTE_NAME ) String name,
   @FormParam( Constants.ENROLLMENT_ATTRIBUTE_EMAIL ) String email,
   @FormParam( Constants.ENROLLMENT_ATTRIBUTE_PHONE ) String phone,
   @PathParam( Constants.VERSION ) Integer nVersion )
   {
       switch ( nVersion )
       {
           case VERSION_1:
               return createEnrollmentV1( enrollment, name, email, phone );
           default:
               break;
       }
       _logger.error( Constants.ERROR_NOT_FOUND_VERSION );
       return Response.status( Response.Status.NOT_FOUND )
               .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.NOT_FOUND.name( ), Constants.ERROR_NOT_FOUND_VERSION ) ) )
               .build( );
   }

   /**
    * Create Enrollment V1
    * @param name the name
    * @param email the email
    * @param phone the phone
    * @return the Enrollment if created for the version 1
    */
   private Response createEnrollmentV1( String enrollment, String name, String email, String phone )
   {
       if ( StringUtils.isEmpty(enrollment) || StringUtils.isEmpty( name ) || StringUtils.isEmpty( email ) || StringUtils.isEmpty( phone ) )
       {
           _logger.error( Constants.ERROR_BAD_REQUEST_EMPTY_PARAMETER );
           return Response.status( Response.Status.BAD_REQUEST )
                   .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.BAD_REQUEST.name( ), Constants.ERROR_BAD_REQUEST_EMPTY_PARAMETER ) ) )
                   .build( );
       }

       Enrollment _enrollment = new Enrollment( );
       _enrollment.setProgram( enrollment );
       _enrollment.setName( name );
       _enrollment.setEmail( email );
       _enrollment.setPhone( phone );
       EnrollmentHome.create( _enrollment );

       return Response.status( Response.Status.OK )
               .entity( JsonUtil.buildJsonResponse( new JsonResponse( _enrollment ) ) )
               .build( );
   }

   /**
    * Modify Enrollment
    * @param nVersion the API version
    * @param id the id
    * @param name the name
    * @param email the email
    * @param phone the phone
    * @return the Enrollment if modified
    */
   @PUT
   @Path( Constants.ID_PATH )
   @Produces( MediaType.APPLICATION_JSON )
   public Response modifyEnrollment(
   @PathParam( Constants.ID ) Integer id,
   @FormParam( Constants.ENROLLMENT_ATTRIBUTE_PROGRAM ) String enrollment,
   @FormParam( Constants.ENROLLMENT_ATTRIBUTE_NAME ) String name,
   @FormParam( Constants.ENROLLMENT_ATTRIBUTE_EMAIL ) String email,
   @FormParam( Constants.ENROLLMENT_ATTRIBUTE_PHONE ) String phone,
   @PathParam( Constants.VERSION ) Integer nVersion )
   {
       switch ( nVersion )
       {
           case VERSION_1:
               return modifyEnrollmentV1( id, enrollment, name, email, phone );
           default:
               break;
       }
       _logger.error( Constants.ERROR_NOT_FOUND_VERSION );
       return Response.status( Response.Status.NOT_FOUND )
               .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.NOT_FOUND.name( ), Constants.ERROR_NOT_FOUND_VERSION ) ) )
               .build( );
   }

   /**
    * Modify Enrollment V1
    * @param id the id
    * @param name the name
    * @param email the email
    * @param phone the phone
    * @return the Enrollment if modified for the version 1
    */
   private Response modifyEnrollmentV1( Integer id, String enrollment, String name, String email, String phone )
   {
       if ( StringUtils.isEmpty(enrollment) || StringUtils.isEmpty( name ) || StringUtils.isEmpty( email ) || StringUtils.isEmpty( phone ) )
       {
           _logger.error( Constants.ERROR_BAD_REQUEST_EMPTY_PARAMETER );
           return Response.status( Response.Status.BAD_REQUEST )
                   .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.BAD_REQUEST.name( ), Constants.ERROR_BAD_REQUEST_EMPTY_PARAMETER ) ) )
                   .build( );
       }

       Enrollment _enrollment = EnrollmentHome.findByPrimaryKey( id );
       if ( _enrollment == null )
       {
           _logger.error( Constants.ERROR_NOT_FOUND_RESOURCE );
           return Response.status( Response.Status.NOT_FOUND )
                   .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.NOT_FOUND.name( ), Constants.ERROR_NOT_FOUND_RESOURCE ) ) )
                   .build( );
       }

       _enrollment.setProgram(enrollment);
       _enrollment.setName( name );
       _enrollment.setEmail( email );
       _enrollment.setPhone( phone );
       EnrollmentHome.update( _enrollment );

       return Response.status( Response.Status.OK )
               .entity( JsonUtil.buildJsonResponse( new JsonResponse( _enrollment ) ) )
               .build( );
   }

   /**
    * Delete Enrollment
    * @param nVersion the API version
    * @param id the id
    * @return the Enrollment List if deleted
    */
   @DELETE
   @Path( Constants.ID_PATH )
   @Produces( MediaType.APPLICATION_JSON )
   public Response deleteEnrollment(
   @PathParam( Constants.VERSION ) Integer nVersion,
   @PathParam( Constants.ID ) Integer id )
   {
       switch ( nVersion )
       {
           case VERSION_1:
               return deleteEnrollmentV1( id );
           default:
               break;
       }
       _logger.error( Constants.ERROR_NOT_FOUND_VERSION );
       return Response.status( Response.Status.NOT_FOUND )
               .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.NOT_FOUND.name( ), Constants.ERROR_NOT_FOUND_VERSION ) ) )
               .build( );
   }

   /**
    * Delete Enrollment V1
    * @param id the id
    * @return the Enrollment List if deleted for the version 1
    */
   private Response deleteEnrollmentV1( Integer id )
   {
       Enrollment _enrollment = EnrollmentHome.findByPrimaryKey( id );
       if ( _enrollment == null )
       {
           _logger.error( Constants.ERROR_NOT_FOUND_RESOURCE );
           return Response.status( Response.Status.NOT_FOUND )
                   .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.NOT_FOUND.name( ), Constants.ERROR_NOT_FOUND_RESOURCE ) ) )
                   .build( );
       }

       EnrollmentHome.remove( id );

       return Response.status( Response.Status.OK )
               .entity( JsonUtil.buildJsonResponse( new JsonResponse( Constants.EMPTY_OBJECT ) ) )
               .build( );
   }

   /**
    * Get Enrollment
    * @param nVersion the API version
    * @param id the id
    * @return the Enrollment
    */
   @GET
   @Path( Constants.ID_PATH )
   @Produces( MediaType.APPLICATION_JSON )
   public Response getEnrollment(
   @PathParam( Constants.VERSION ) Integer nVersion,
   @PathParam( Constants.ID ) Integer id )
   {
       switch ( nVersion )
       {
           case VERSION_1:
               return getEnrollmentV1( id );
           default:
               break;
       }
       _logger.error( Constants.ERROR_NOT_FOUND_VERSION );
       return Response.status( Response.Status.NOT_FOUND )
               .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.NOT_FOUND.name( ), Constants.ERROR_NOT_FOUND_VERSION ) ) )
               .build( );
   }

   /**
    * Get Enrollment V1
    * @param id the id
    * @return the Enrollment for the version 1
    */
   private Response getEnrollmentV1( Integer id )
   {
       Enrollment _enrollment = EnrollmentHome.findByPrimaryKey( id );
       if ( _enrollment == null )
       {
           _logger.error( Constants.ERROR_NOT_FOUND_RESOURCE );
           return Response.status( Response.Status.NOT_FOUND )
                   .entity( JsonUtil.buildJsonResponse( new ErrorJsonResponse( Response.Status.NOT_FOUND.name( ), Constants.ERROR_NOT_FOUND_RESOURCE ) ) )
                   .build( );
       }

       return Response.status( Response.Status.OK )
               .entity( JsonUtil.buildJsonResponse( new JsonResponse( _enrollment ) ) )
               .build( );
   }
}
