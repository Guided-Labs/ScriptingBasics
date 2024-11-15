import yaml

def generate_compose():
    # Define the structure of the Docker Compose file
    compose_content = {
        'version': '3',
        'services': {
            'web': {
                'image': 'my_todoapp',
                'ports': ['8081:8081'],
                'networks': ['todoapp_network'],
            },
            'db': {
                'image': 'mysql:8.0',
                'environment': {
                    'MYSQL_ROOT_PASSWORD': 'rootpassword',
                    'MYSQL_DATABASE': 'todoapp_db',
                    'MYSQL_USER': 'root',
                    'MYSQL_PASSWORD': 'P@ssw0rd'
                },
                'networks': ['todoapp_network'],
                'volumes': ['db_data:/var/lib/mysql']
            }
        },
        'networks': {
            'todoapp_network': {
                'driver': 'bridge'
            }
        },
        'volumes': {
            'db_data': {}
        }
    }

    # Write the Docker Compose content to a YAML file
    with open('docker-compose.yml', 'w') as compose_file:
        yaml.dump(compose_content, compose_file, default_flow_style=False)

    print("docker-compose.yml generated successfully!")


if __name__ == '__main__':
    generate_compose()