package unp.student.work.manager.domain;
// default package



/**
 * teacher_quanxian entity. @author MyEclipse Persistence Tools
 */

public class TeacherQuanxian  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String passname;
     private String password;
     private String quanxian;


    // Constructors

    /** default constructor */
    public TeacherQuanxian() {
    }

    
    /** full constructor */
    public TeacherQuanxian(String passname, String password, String quanxian) {
        this.passname = passname;
        this.password = password;
        this.quanxian = quanxian;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassname() {
        return this.passname;
    }
    
    public void setPassname(String passname) {
        this.passname = passname;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getQuanxian() {
        return this.quanxian;
    }
    
    public void setQuanxian(String quanxian) {
        this.quanxian = quanxian;
    }
   








}