package unp.student.work.manager.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="apply_scholarship")
public class Scholarship {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String term;
	private int studentID;
	private String profession;
	private String schsort;
	private String status;
	private Date createtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getSchsort() {
		return schsort;
	}
	public void setSchsort(String schsort) {
		this.schsort = schsort;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}

	public Scholarship(int id, String term, int studentID, String profession, String schsort, String status,
			Date createtime) {
		super();
		this.id = id;
		this.term = term;
		this.studentID = studentID;
		this.profession = profession;
		this.schsort = schsort;
		this.status = status;
		this.createtime = createtime;
	}
	public Scholarship() {
		super();
	}
}
