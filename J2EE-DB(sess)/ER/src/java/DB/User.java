package DB;
// Generated Jul 2, 2014 10:50:08 AM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private Integer id;
     private UserType userType;
     private String UName;
     private String password;
     private String firstName;
     private String lastName;
     private String email;
     private String address;
     private String mobile;
     private Set userLogins = new HashSet(0);

    public User() {
    }

	
    public User(UserType userType, String UName, String password, String firstName, String lastName, String email, String address, String mobile) {
        this.userType = userType;
        this.UName = UName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.address = address;
        this.mobile = mobile;
    }
    public User(UserType userType, String UName, String password, String firstName, String lastName, String email, String address, String mobile, Set userLogins) {
       this.userType = userType;
       this.UName = UName;
       this.password = password;
       this.firstName = firstName;
       this.lastName = lastName;
       this.email = email;
       this.address = address;
       this.mobile = mobile;
       this.userLogins = userLogins;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public UserType getUserType() {
        return this.userType;
    }
    
    public void setUserType(UserType userType) {
        this.userType = userType;
    }
    public String getUName() {
        return this.UName;
    }
    
    public void setUName(String UName) {
        this.UName = UName;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getFirstName() {
        return this.firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getMobile() {
        return this.mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public Set getUserLogins() {
        return this.userLogins;
    }
    
    public void setUserLogins(Set userLogins) {
        this.userLogins = userLogins;
    }




}


