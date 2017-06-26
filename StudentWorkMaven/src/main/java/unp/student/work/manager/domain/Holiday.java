package unp.student.work.manager.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "apply_holiday")
public class Holiday {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		private String starttime;
		private String endtime;
		private int phone;
		private String dormitory;
		private String statement;
		private String status;
		private Date createtime;
		
		public Date getCreatetime() {
			return createtime;
		}
		public void setCreatetime(Date createtime) {
			this.createtime = createtime;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getPhone() {
			return phone;
		}
		public void setPhone(int phone) {
			this.phone = phone;
		}
		public String getDormitory() {
			return dormitory;
		}
		public void setDormitory(String dormitory) {
			this.dormitory = dormitory;
		}
		public String getStatement() {
			return statement;
		}
		public void setStatement(String statement) {
			this.statement = statement;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		
		public String getStarttime() {
			return starttime;
		}
		public void setStarttime(String starttime) {
			this.starttime = starttime;
		}
		public String getEndtime() {
			return endtime;
		}
		public void setEndtime(String endtime) {
			this.endtime = endtime;
		}
		public Holiday(int id, String starttime, String endtime, int phone, String dormitory, String statement, String status,
				Date createtime) {
			super();
			this.id = id;
			this.starttime = starttime;
			this.endtime = endtime;
			this.phone = phone;
			this.dormitory = dormitory;
			this.statement = statement;
			this.status = status;
			this.createtime = createtime;
		}
		public Holiday() {
			super();
		}
}
