FROM python:3

# Install required system packages (distutils and build tools)
RUN apt-get update && apt-get install -y \
    python3-distutils \
    build-essential \
    python3-dev

# Install Django 3.2
RUN pip install django==3.2

# Copy your project files
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

