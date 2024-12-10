<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" errorPage="error.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring-form" %>

<%@ include file="header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Include Chart.js -->
<script>
function validateInput() {
    var tenure = document.getElementById("tenure").value;
    var loanAmt = document.getElementById("loan").value;
    var rate = document.getElementById("annualInterestRate").value;

    if (!tenure || !loanAmt || !rate) {
        alert("Please fill in all required fields.");
        return false;
    }
    return true;
}

// Data for the chart (can be dynamically passed from the backend)
const chartData = {
    labels: ["18-25", "26-35", "36-45", "46-55", "56+"], // Age ranges
    datasets: [
        {
            label: "Eligible Customers",
            data: [50, 75, 100, 60, 30], // Average number of customers per age group
            backgroundColor: "rgba(54, 162, 235, 0.6)",
            borderColor: "rgba(54, 162, 235, 1)",
            borderWidth: 1,
        }
    ]
};

function renderChart() {
    const ctx = document.getElementById('eligibilityChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: chartData,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}
</script>

<div class="container">
    <script>document.getElementById('calcLink').classList.add('active');</script>
    <div id="main-container" class="container col-sm-6 my-5 py-5">

        <c:url var="calculateEmi" value="/calculateEmi"></c:url>
        <spring-form:form action="${calculateEmi}" method="post" modelAttribute="calvalues" class="rounded border border-dark p-3">
        
            <h3 class="d-flex justify-content-center">EMI Calculator</h3>
            <br>
        
            <div class="form-group row">
                <label for="tenure" class="d-flex flex-row justify-content-sm-end col-sm-6 col-form-label col-form-label-sm">Tenure <small>(Years)</small></label>
                <div class="col-sm-6">
                    <spring-form:input path="tenure" type="number" class="form-control form-control-sm" id="tenure" placeholder="Tenure"/>
                    <spring-form:errors path="tenure">
                        <script>document.getElementById('tenure').classList.add('is-invalid');</script>
                        <div class="invalid-feedback">Please enter valid months</div>
                    </spring-form:errors>
                </div>
            </div>
            
            <div class="form-group row">
                <label for="loan" class="d-flex flex-row justify-content-sm-end col-sm-6 col-form-label col-form-label-sm">Loan Amount &#8377;</label>
                <div class="col-sm-6">
                    <spring-form:input path="loan" type="text" class="form-control form-control-sm" id="loan" placeholder="Loan Amount" />
                    <spring-form:errors path="loan">
                        <script>document.getElementById('loan').classList.add('is-invalid');</script>
                        <div class="invalid-feedback">Please enter a valid loan amount</div>
                    </spring-form:errors>
                </div>
            </div>
            
            <div class="form-group row">
                <label for="annualInterestRate" class="d-flex flex-row justify-content-sm-end col-sm-6 col-form-label col-form-label-sm">Annual Interest Rate (%)</label>
                <div class="col-sm-6">
                    <spring-form:input path="rate" type="text" class="form-control form-control-sm" id="annualInterestRate" placeholder="Rate (e.g., 8.5)" />
                    <spring-form:errors path="rate">
                        <script>document.getElementById('annualInterestRate').classList.add('is-invalid');</script>
                        <div class="invalid-feedback">Please enter a valid interest rate</div>
                    </spring-form:errors>
                </div>
            </div>
            
            <div class="form-group row d-flex flex-row justify-content-center">
                <button type="submit" class="btn btn-unique" onclick="return validateInput();">Calculate</button>
            </div>
            
            <div class="form-group row d-flex flex-row justify-content-center">
                <strong>EMI: &#8377;${emi}</strong>
            </div>
        
        </spring-form:form>
    </div>
    
    <!-- Add the Chart -->
    <div class="container mt-5">
        <h3 class="text-center">Average Eligible Customers by Age Group</h3>
        <canvas id="eligibilityChart"></canvas>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', renderChart);
</script>

<%@ include file="footer.jsp" %>