import subprocess
import sys

# Set variables
image_name = "todoapp_image"
container_name = "todoapp_container"
port = "8081:8081"

def run_command(command):
    """Run shell commands and handle errors."""
    try:
        result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print(result.stdout.decode())
    except subprocess.CalledProcessError as e:
        print(f"Error running command: {command}")
        print(e.stderr.decode())
        sys.exit(1)

# Step 1: Build Docker image
print("Building Docker image...")
run_command(f"docker build -t {image_name} .")

# Step 2: Run Docker container
print("Running Docker container...")
run_command(f"docker run -d --name {container_name} -p {port} --network=todoapp_network -e MYSQL_HOST=mysqldb {image_name}")

print(f"TodoApp is running on http://localhost:{port.split(':')[0]}")