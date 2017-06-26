package unp.student.work.manager.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="apply_support")
public class Support {
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int id;
		private String term;
		private int studentID;
		private String level;
		private String profession;
		private String supsort;
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
		public int getStudentID() {
			return studentID;
		}
		public void setStudentID(int studentID) {
			this.studentID = studentID;
		}
		public String getLevel() {
			return level;
		}
		public void setLevel(String level) {
			this.level = level;
		}
		public String getProfession() {
			return profession;
		}
		public void setProfession(String profession) {
			this.profession = profession;
		}
		public String getSupsort() {
			return supsort;
		}
		public void setSupsort(String supsort) {
			this.supsort = supsort;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public Date getCreatetime() {
			return createtime;
		}
		public void setCreatetime(Date createtime) {
			this.createtime = createtime;
		}
		public Support(int id, String term, int studentID, String level, String profession, String supsort, String status,
				Date createtime) {
			super();
			this.id = id;
			this.term = term;
			this.studentID = studentID;
			this.level = level;
			this.profession = profession;
			this.supsort = supsort;
			this.status = status;
			this.createtime = createtime;
		}
		public Support() {
			super();
		}
		
}
