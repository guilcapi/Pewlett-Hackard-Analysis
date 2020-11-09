SELECT e.emp_no,
first_name,
last_name,
title,
from_date,
to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles
ON e.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' and '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT count(title),
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;