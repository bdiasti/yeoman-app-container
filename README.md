### Installation

docker build -t [USER-NAME]/yeoman-app .

docker run -d -p 9000:9000 --name yeoman_container [USER-NAME]/yeoman_app

test in browser: http://localhost:9000