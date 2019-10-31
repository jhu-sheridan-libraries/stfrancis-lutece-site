package fr.paris.lutece.plugins.enroll.business.enrollment;

import javax.validation.constraints.*;
import org.hibernate.validator.constraints.*;
import java.io.Serializable;

public class Enrollment implements Serializable {
  private int _nId;
  private int _projectId;
  private String _strEnrollment;
  @NotEmpty( message = "#i18n{enroll.validation.enrollment.Name.notEmpty}" )
  @Size( max = 50 , message = "#i18n{enroll.validation.enrollment.Name.size}" )
  private String _strContactName;
  @NotEmpty( message = "#i18n{enroll.validation.enrollment.Email.notEmpty}" )
  @Size( max = 50 , message = "#i18n{enroll.validation.enrollment.Email.size}" )
  private String _strContactEmail;
  @NotEmpty( message = "#i18n{enroll.validation.enrollment.Phone.notEmpty}" )
  @Size( max = 50 , message = "#i18n{enroll.validation.enrollment.Phone.size}" )
  private String _strContactNumber;

  public int getId() {
    return _nId;
  }

  public void setId(int id) {
    _nId = id;
  }

  public String getEnrollment() {
    return _strEnrollment;
  }

  public void setEnrollment(String enrollmentName) {
    _strEnrollment = enrollmentName;
  }

  public String getContactName() {
    return _strContactName;
  }

  public void setContactName(String name) {
    _strContactName = name;
  }

  public String getContactEmail() {
    return _strContactEmail;
  }

  public void setContactEmail(String email) {
    _strContactEmail = email;
  }

  public String getContactNumber() {
    return _strContactNumber;
  }

  public void setContactNumber(String number) {
    _strContactNumber = number;
  }
}
