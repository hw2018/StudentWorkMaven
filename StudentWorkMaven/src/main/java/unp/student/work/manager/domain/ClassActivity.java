package unp.student.work.manager.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="class_activity")
public class ClassActivity {
	@Id
	@GeneratedValue
	private Integer id;
	private String name;
    //
	private String studentid;
   // @ManyToOne(targetEntity=PersonInfo.class)
   // @JoinColumn(name="studentid",nullable=false)
   // private PersonInfo person;
	private String place;
	private String content;
    private Date date;
    private String number;
    private String master;
    
    
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	//public PersonInfo getPerson() {
	//	return person;
	//}
	//public void setPerson(PersonInfo person) {
	//	this.person = person;
	//}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
    
}	