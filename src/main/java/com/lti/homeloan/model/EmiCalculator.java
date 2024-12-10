package com.lti.homeloan.model;

public class EmiCalculator {
private Double loan;
private Double tenure;
private Double rate;

public EmiCalculator() {
	// TODO Auto-generated constructor stub
}


public EmiCalculator(Double loan, Double tenure, Double rate) {
	super();
	this.loan = loan;
	this.tenure = tenure;
	this.rate=rate;
}


public Double getLoan() {
	return loan;
}


public void setLoan(Double loan) {
	this.loan = loan;
}


public Double getTenure() {
	return tenure;
}


public void setTenure(Double tenure) {
	this.tenure = tenure;
}

public Double getrate() {
	return rate;
}


public void setrate(Double rate) {
	this.rate = rate;
}


@Override
public String toString() {
	return "EmiCalculator [loan=" + loan + ", tenure=" + tenure + "]";
}


}