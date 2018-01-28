-- HR Analytics Data Warehouse

-- Employee Dimension (SCD Type 2)
CREATE TABLE dwh.dim_employee (
    employee_key BIGINT IDENTITY(1,1) PRIMARY KEY,
    employee_id VARCHAR(50),
    full_name VARCHAR(200),
    email VARCHAR(200),
    hire_date DATE,
    termination_date DATE,
    department VARCHAR(100),
    job_title VARCHAR(200),
    job_level VARCHAR(50),
    manager_id VARCHAR(50),
    location VARCHAR(100),
    employment_type VARCHAR(50),
    is_active BOOLEAN,
    effective_date TIMESTAMP,
    end_date TIMESTAMP,
    is_current BOOLEAN
) DISTSTYLE ALL;

-- Compensation Fact
CREATE TABLE dwh.fact_compensation (
    comp_key BIGINT IDENTITY(1,1),
    employee_key BIGINT,
    effective_date DATE,
    base_salary DECIMAL(18,2),
    bonus DECIMAL(18,2),
    equity_value DECIMAL(18,2),
    total_compensation DECIMAL(18,2),
    currency_code VARCHAR(3)
) DISTKEY(employee_key);

-- Attrition Fact
CREATE TABLE dwh.fact_attrition (
    attrition_key BIGINT IDENTITY(1,1),
    employee_key BIGINT,
    termination_date DATE,
    termination_reason VARCHAR(200),
    termination_type VARCHAR(50),
    tenure_months INT,
    is_voluntary BOOLEAN,
    is_regrettable BOOLEAN
) DISTKEY(employee_key);

-- Performance Reviews Fact
CREATE TABLE dwh.fact_performance (
    review_key BIGINT IDENTITY(1,1),
    employee_key BIGINT,
    review_date DATE,
    review_period VARCHAR(50),
    overall_rating DECIMAL(3,2),
    goals_met INT,
    goals_total INT,
    promotion_ready BOOLEAN
) DISTKEY(employee_key);
