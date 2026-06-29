# n8n Employee Birthday Automation

An AI-powered employee birthday email automation workflow built using **n8n**, **Ollama (Llama 3.2)**, **Docker**, and **SMTP**.

## Overview

This project automates the process of sending personalized birthday emails to employees.

The workflow reads employee information from a CSV file, checks whether today's date matches an employee's birthday, generates a personalized birthday message using a locally hosted AI model (Llama 3.2 via Ollama), and sends the email automatically using SMTP.

---

## Features

- Daily scheduled execution
- Reads employee data from a CSV file
- Identifies birthdays automatically
- Generates personalized birthday wishes using AI
- Sends emails automatically via SMTP
- Runs locally using Ollama (no cloud AI APIs)
- Docker-based deployment
- Basic error handling

---

## Technologies Used

- n8n
- Ollama
- Llama 3.2
- Docker
- SMTP
- CSV

---

## Project Structure

```text
n8n-employee-birthday-automation/
│
├── README.md
├── LICENSE
├── workflow.json
│
├── data/
│   └── sample-employees.csv
│
├── docs/
│
└── screenshots/
    ├── workflow.png
    └── sample-email.png
```

---

## Workflow

1. Schedule Trigger starts every day.
2. Employee data is read from a CSV file.
3. The workflow checks if today's date matches an employee's birthday.
4. If a birthday is found:
   - AI generates a personalized birthday message.
   - SMTP sends the email.
5. If no birthdays are found, the workflow ends.

---

## Screenshots

### Workflow

_Add your workflow screenshot here._

### Sample Email

_Add your email screenshot here._

---

## Future Improvements

- HTML email templates
- HR database integration
- Microsoft 365 integration
- Employee work anniversary automation
- Logging and reporting dashboard

---

## License

This project is licensed under the MIT License.