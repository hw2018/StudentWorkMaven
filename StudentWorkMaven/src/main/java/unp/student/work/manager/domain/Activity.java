package unp.student.work.manager.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="apply_activity")
public class Activity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int peoplenumber;
	private int carnumber;
	private String leadteacher;
	private String principal;
	private String status;
	private Date    createTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPeoplenumber() {
		return peoplenumber;
	}
	public void setPeoplenumber(int peoplenumber) {
		this.peoplenumber = peoplenumber;
	}
	public int getCarnumber() {
		return carnumber;
	}
	public void setCarnumber(int carnumber) {
		this.carnumber = carnumber;
	}
	public String getLeadteacher() {
		return leadteacher;
	}
	public void setLeadteacher(String leadteacher) {
		this.leadteacher = leadteacher;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Activity(int peoplenumber, int carnumber, String leadteacher, String principal,String status,Date createTime) {
		super();
		this.peoplenumber = peoplenumber;
		this.carnumber = carnumber;
		this.leadteacher = leadteacher;
		this.principal = principal;
		this.createTime = createTime;
		this.status=status;
	}
	public Activity() {
		super();
	}
}
