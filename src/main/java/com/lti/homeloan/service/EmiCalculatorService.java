package com.lti.homeloan.service;

import org.springframework.stereotype.Service;

import com.lti.homeloan.model.EmiCalculator;

@Service
public class EmiCalculatorService implements IEmiCalculatorService {

	@Override
	public Double calculatemi(EmiCalculator emicalculator) {
			Double loan = emicalculator.getLoan();
			Double tenure = emicalculator.getTenure();
			Double rate = emicalculator.getrate();
			rate=rate/100;
			
			//Double emi =loan*rate*(Math.pow(1+rate,tenure))/Math.pow(1+rate,tenure-1);
			
			 Double monthlyRate = rate / 12;

			    // Convert tenure from years to months
			    Double tenureInMonths = tenure * 12;

			    // Calculate EMI using the formula
			    Double emi = loan * monthlyRate * 
			                 Math.pow(1 + monthlyRate, tenureInMonths) / 
			                 (Math.pow(1 + monthlyRate, tenureInMonths) - 1);
		return emi;
	}

}