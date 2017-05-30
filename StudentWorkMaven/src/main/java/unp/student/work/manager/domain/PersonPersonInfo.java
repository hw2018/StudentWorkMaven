package unp.student.work.manager.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="person_info")
public class PersonPersonInfo {
	@Id
	@GenericGenerator(name="assigned",strategy="assigned")
	@GeneratedValue(generator="assigned")
	@Column(name="studentid")
	private String studentid;
	
	@Column(name="name")
	private String name;
	
	@Column(name="sex")
	private String sex;
	
	@Column(name="idcard")
	private String idcard;
	
	@Column(name="nation")
	private String nation;   //民族
	
	@Column(name="birthday")
	private Date birthday;
	
	@Column(name="placeofbirth")
	private String placeofbirth;
	
	@Column(name="politicalstatus")
	private String politicalstatus;
	
	@Column(name="major")
	private String major;   //专业id
	
	@Column(name="grade")
	private String grade;  //年级
	
	@Column(name="tel")
	private String tel;
	
	@Column(name="email")
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Column(name="college")
	private String college;  //学院
	
	@Column(name="status")
	private String status;   //在校状态
	
	@Column(name="build")
	private int build;   //楼号
	
	@Column(name="hostel")
	private int hostel;  //宿舍号
	
	
	@OneToMany(mappedBy="personPersonInfo")
	private Set<PersonFavorite> personFavorites = new HashSet<PersonFavorite>();
	
	

	

	public PersonPersonInfo() {
		super();
	}





	public PersonPersonInfo(String studentid, String name, String sex, String idcard, String nation, Date birthday,
			String placeofbirth, String politicalstatus, String major, String grade, String tel, String email,
			String password, String college, String status, int build, int hostel) {
		super();
		this.studentid = studentid;
		this.name = name;
		this.sex = sex;
		this.idcard = idcard;
		this.nation = nation;
		this.birthday = birthday;
		this.placeofbirth = placeofbirth;
		this.politicalstatus = politicalstatus;
		this.major = major;
		this.grade = grade;
		this.tel = tel;
		this.email = email;
		this.password = password;
		this.college = college;
		this.status = status;
		this.build = build;
		this.hostel = hostel;
	}





	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPlaceofbirth() {
		return placeofbirth;
	}

	public void setPlaceofbirth(String placeofbirth) {
		this.placeofbirth = placeofbirth;
	}

	public String getPoliticalstatus() {
		return politicalstatus;
	}

	public void setPoliticalstatus(String politicalstatus) {
		this.politicalstatus = politicalstatus;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	public int getBuild() {
		return build;
	}

	public void setBuild(int build) {
		this.build = build;
	}

	public int getHostel() {
		return hostel;
	}

	public void setHostel(int hostel) {
		this.hostel = hostel;
	}
	
	
	
	public Set<PersonFavorite> getPersonFavorites() {
		return personFavorites;
	}

	public void setPersonFavorites(Set<PersonFavorite> personFavorites) {
		this.personFavorites = personFavorites;
	}
}
