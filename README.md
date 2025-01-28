# Gulf of Mexico Name Checker

A web application that monitors the official name of the Gulf of Mexico using the USGS Geographic Names Information System (GNIS) API. The app polls the API every 30 seconds to check if the name has changed from "Gulf of Mexico".

![Gulf of Mexico from Space](public/images/gulf.jpg)

## Features

- Real-time monitoring of the Gulf of Mexico's official name
- Automatic polling every 30 seconds
- Visual feedback when name changes occur
- Start/Stop polling control
- Responsive design with wave animations
- Docker containerization for easy deployment

## Prerequisites

- Docker and Docker Compose
- Node.js 18+ (for local development)
- npm (Node Package Manager)

## Quick Start

1. With Docker (recommended):
```bash
# Build and start the container
npm run docker:up

# View logs
npm run docker:logs
```

2. Without Docker (local development):
```bash
npm install
npm run dev
```

The application will be available at http://localhost:3000

## Available Scripts

- `npm start` - Run the application in production mode
- `npm run dev` - Run the application in development mode with auto-reload
- `npm run docker:build` - Build the Docker container
- `npm run docker:up` - Start the Docker container in detached mode
- `npm run docker:down` - Stop and remove the Docker container
- `npm run docker:logs` - View Docker container logs
- `npm run docker:restart` - Restart the Docker container
- `npm run docker:rebuild` - Full rebuild of the Docker container

## Project Structure

- `server.js` - Express server handling API proxy requests
- `public/` - Static assets and frontend
  - `index.html` - Main application interface
  - `images/` - Image assets
- `Dockerfile` - Container configuration
- `docker-compose.yml` - Docker Compose setup with development mode support

## Development

The project includes Docker development mode with hot-reloading:
- Changes to package.json trigger container rebuild
- Source code changes are synced in real-time
- Nodemon auto-restarts the server

## Dependencies

- Express.js - Web server framework
- node-fetch - Fetch API for Node.js
- nodemon (dev) - Development auto-reloader

## Technical Details

- Frontend: Vanilla JavaScript, CSS3 with animations
- Backend: Node.js with Express
- API: USGS Geographic Names Information System GraphQL API
- Container: Node.js 18 slim image
