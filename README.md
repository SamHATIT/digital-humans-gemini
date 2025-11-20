# Digital Humans - Front-End System

A comprehensive web application for automated Salesforce specification generation using multi-agent AI systems.

## Project Overview

Digital Humans is a full-stack web application that provides an interface to manage and execute Salesforce specification generation through intelligent AI agents. Users can create projects, upload requirements, select relevant agents, and monitor real-time execution progress.

## Tech Stack

### Backend
- **Framework:** FastAPI (Python 3.10+)
- **Database:** PostgreSQL 16
- **ORM:** SQLAlchemy 2.0
- **Authentication:** JWT (python-jose)
- **Password Hashing:** Passlib with bcrypt
- **Real-time Communication:** WebSockets
- **Testing:** Pytest

### Frontend
- **Framework:** React 18
- **Build Tool:** Vite
- **Styling:** Tailwind CSS
- **State Management:** React Context API
- **HTTP Client:** Axios

## Features

### Core Functionality
- User authentication (register, login, JWT tokens)
- Project management (CRUD operations)
- Requirements upload (text or file)
- Agent selection and configuration
- Real-time execution monitoring via WebSockets
- Output file generation and download (.docx)
- Execution history and logs

### Day 1 Progress (Backend Foundation)
- ✅ Complete backend structure
- ✅ SQLAlchemy models (Users, Projects, Agents, Executions, Outputs)
- ✅ Pydantic schemas for validation
- ✅ Authentication routes (register, login, me)
- ✅ JWT token management
- ✅ Password hashing utilities
- ✅ Unit tests for authentication
- ✅ Database configuration

## Project Structure

```
front-end-digital-humans/
├── backend/
│   ├── app/
│   │   ├── api/
│   │   │   └── routes/
│   │   │       └── auth.py          # Authentication endpoints
│   │   ├── models/                  # SQLAlchemy models
│   │   │   ├── user.py
│   │   │   ├── project.py
│   │   │   ├── agent.py
│   │   │   ├── execution.py
│   │   │   ├── execution_agent.py
│   │   │   └── output.py
│   │   ├── schemas/                 # Pydantic schemas
│   │   │   ├── user.py
│   │   │   ├── project.py
│   │   │   ├── agent.py
│   │   │   ├── execution.py
│   │   │   └── output.py
│   │   ├── services/                # Business logic
│   │   ├── utils/                   # Utilities
│   │   │   ├── auth.py             # Auth utilities
│   │   │   └── dependencies.py     # FastAPI dependencies
│   │   ├── config.py               # Configuration
│   │   ├── database.py             # Database setup
│   │   └── main.py                 # FastAPI app
│   ├── tests/                      # Unit tests
│   │   ├── conftest.py
│   │   └── test_auth.py
│   ├── requirements.txt
│   ├── .env
│   └── .env.example
├── frontend/                        # To be implemented (Day 3-4)
└── README.md
```

## Database Schema

### Users
- id (PK)
- email (unique)
- hashed_password
- name
- is_active
- created_at, updated_at

### Projects
- id (PK)
- user_id (FK)
- name
- description
- requirements_text
- requirements_file_path
- status (draft, active, completed, archived)
- created_at, updated_at

### Agents
- id (PK)
- name (unique)
- description
- icon
- estimated_time
- cost_estimate

### Executions
- id (PK)
- project_id (FK)
- user_id (FK)
- status (pending, running, completed, failed, cancelled)
- progress (0-100)
- current_agent
- logs (JSON)
- total_cost
- duration_seconds
- started_at, completed_at, created_at

### Execution_Agents
- id (PK)
- execution_id (FK)
- agent_id (FK)
- status (pending, running, completed, failed)
- started_at, completed_at
- cost

### Outputs
- id (PK)
- project_id (FK)
- execution_id (FK)
- agent_id (FK)
- file_name
- file_path
- file_size
- mime_type
- created_at

## Backend Setup

### Prerequisites
- Python 3.10 or higher
- PostgreSQL 16
- Virtual environment tool (venv or virtualenv)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/SamHATIT/front-end-digital-humans.git
   cd front-end-digital-humans/backend
   ```

2. **Create and activate virtual environment:**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure environment variables:**
   ```bash
   cp .env.example .env
   # Edit .env with your database credentials and secret key
   ```

5. **Create database:**
   ```bash
   createdb digital_humans
   ```

6. **Run the application:**
   ```bash
   python -m app.main
   # or
   uvicorn app.main:app --reload
   ```

The API will be available at `http://localhost:8000`

### Running Tests

```bash
pytest tests/ -v
```

### API Documentation

Once the server is running, visit:
- Swagger UI: `http://localhost:8000/docs`
- ReDoc: `http://localhost:8000/redoc`

## API Endpoints (Day 1)

### Authentication

- **POST** `/api/auth/register` - Register new user
  ```json
  {
    "email": "user@example.com",
    "name": "John Doe",
    "password": "securepassword123"
  }
  ```

- **POST** `/api/auth/login` - Login user
  ```json
  {
    "email": "user@example.com",
    "password": "securepassword123"
  }
  ```

- **GET** `/api/auth/me` - Get current user (requires authentication)
  ```
  Authorization: Bearer <token>
  ```

## Development Timeline

### Day 1 (Today) ✅
- Backend foundation setup
- Authentication system
- Database models
- Unit tests

### Day 2 (Next)
- Projects CRUD routes
- Agents routes
- Executions routes
- Agent orchestration service

### Day 3
- WebSocket implementation
- Outputs routes
- Frontend setup (Vite + React)
- Authentication pages

### Day 4
- Frontend project pages
- Execution monitoring
- File upload/download
- WebSocket integration

### Day 5
- Testing and bug fixes
- Documentation
- Docker deployment
- Production ready

## Contributing

This is a private project. For questions or issues, contact the development team.

## License

Proprietary - All rights reserved
