package fr.paris.lutece.plugins.enroll.business.enrollment;

import fr.paris.lutece.portal.service.plugin.Plugin;
import fr.paris.lutece.util.ReferenceList;
import fr.paris.lutece.util.sql.DAOUtil;

import java.util.ArrayList;
import java.util.List;

public final class EnrollmentDAO implements IEnrollmentDAO {
  private static final String SQL_QUERY_NEW_PK = "SELECT max(id_enrollment) FROM enroll_enrollment";
  private static final String SQL_QUERY_SELECT = "SELECT * FROM enroll_enrollment WHERE id_enrollment = ?";
  private static final String SQL_QUERY_INSERT = "INSERT INTO enroll_enrollment(id_enrollment, program_name, contact_name, contact_email, contact_phone) VALUES (?, ?, ?, ?, ?)";
  private static final String SQL_QUERY_DELETE = "DELETE FROM enroll_enrollment WHERE id_enrollment = ?";
  private static final String SQL_QUERY_UPDATE = "UPDATE enroll_enrollment SET id_enrollment = ?, program_name = ?, contact_name = ?, contact_email = ?, contact_phone = ?";
  private static final String SQL_QUERY_SELECTALL = "SELECT * FROM enroll_enrollment";
  private static final String SQL_QUERY_SELECTALL_ID = "SELECT id_enrollment FROM enroll_enrollment";

  /*public int newPrimaryKey( Plugin plugin)
  {
      DAOUtil daoUtil = new DAOUtil( SQL_QUERY_NEW_PK , plugin  );
      daoUtil.executeQuery( );
      int nKey = 1;

      if( daoUtil.next( ) )
      {
          nKey = daoUtil.getInt( 1 ) + 1;
      }

      daoUtil.free();
      return nKey;
  }*/

  @Override
  public synchronized void insert(Enrollment enrollment, Plugin plugin) {
    /*appointment.setIdAppointment( getNewPrimaryKey( SQL_QUERY_NEW_PK, plugin ) );
    DAOUtil daoUtil = buildDaoUtil( SQL_QUERY_INSERT, appointment, plugin, true );
    executeUpdate( daoUtil );*/

  }

  @Override
  public void delete(int key, Plugin plugin) {

  }

  @Override
  public void store(Enrollment enrollment, Plugin plugin) {

  }

  @Override
  public Enrollment load(int key, Plugin plugin) {
    Enrollment enrollment = null;
    return enrollment;
  }

  @Override
  public List<Enrollment> selectEnrollmentsList(Plugin plugin) {
    List<Enrollment> enrollmentList = new ArrayList<Enrollment>();
    return enrollmentList;
  }

  @Override
  public List<Integer> selectIdEnrollmentsList(Plugin plugin) {
    List<Integer> idEnrollmentList = new ArrayList<Integer>();
    return idEnrollmentList;
  }

  @Override
  public ReferenceList selectEnrollmentsReferenceList(Plugin plugin) {
    ReferenceList enrollmentList = new ReferenceList();
    return enrollmentList;
  }
}
