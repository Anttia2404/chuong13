# EmailListApp - Deployment Guide

## 🐳 Docker Deployment

### Prerequisites
- Docker installed on your machine
- PostgreSQL database (already configured on Render)

### Build Docker Image
```bash
cd EmailListApp-Maven
docker build -t emaillistapp .
```

### Run Docker Container Locally
```bash
docker run -p 8080:8080 emaillistapp
```

Access at: `http://localhost:8080`

---

## 🚀 Deploy to Render

### Option 1: Deploy from GitHub

1. **Push code to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin YOUR_GITHUB_REPO_URL
   git push -u origin main
   ```

2. **Create Web Service on Render:**
   - Go to [Render Dashboard](https://dashboard.render.com/)
   - Click **New** → **Web Service**
   - Connect your GitHub repository
   - Configure:
     - **Name**: `emaillistapp`
     - **Environment**: `Docker`
     - **Region**: `Oregon (US West)`
     - **Branch**: `main`
     - **Dockerfile Path**: `./Dockerfile`
   - Click **Create Web Service**

3. **Environment Variables** (if needed):
   - Render will automatically use the `persistence.xml` configuration
   - Database connection is already configured for Render PostgreSQL

### Option 2: Deploy with Render CLI

```bash
# Install Render CLI
npm install -g @render/cli

# Login to Render
render login

# Deploy
render deploy
```

---

## 🔧 Configuration

### Database Connection
The app is already configured to connect to your PostgreSQL database on Render:
- **Host**: `dpg-d47cvdi4d50c73834gmg-a.oregon-postgres.render.com`
- **Port**: `5432`
- **Database**: `my_portfolio_db_vxq1`
- **User**: `my_portfolio_db_vxq1_user`

Connection details are in `src/main/resources/META-INF/persistence.xml`

---

## 📝 Post-Deployment

### Access Your Application
- **Render URL**: `https://emaillistapp.onrender.com` (or your custom domain)
- **Email List**: `/`
- **User Admin**: `/admin/users`

### Test the Application
1. Add a user via Email List form
2. View users in User Admin
3. Test Update and Delete operations

---

## 🐛 Troubleshooting

### Container won't start
```bash
# Check logs
docker logs CONTAINER_ID

# Or on Render, check the Logs tab
```

### Database connection issues
- Verify PostgreSQL is running on Render
- Check `persistence.xml` has correct credentials
- Ensure Render allows connections from your web service

### Build fails
```bash
# Clean and rebuild
mvn clean package
docker build --no-cache -t emaillistapp .
```

---

## 📊 Monitoring

On Render Dashboard:
- **Logs**: Real-time application logs
- **Metrics**: CPU, Memory usage
- **Events**: Deployment history

---

## 🔄 Update Deployment

### Update code:
```bash
git add .
git commit -m "Update message"
git push origin main
```

Render will automatically rebuild and redeploy!

---

## 💡 Tips

- **Free Tier**: Render free tier spins down after inactivity
- **Custom Domain**: Add in Render Settings → Custom Domains
- **HTTPS**: Automatically enabled on Render
- **Scaling**: Upgrade plan for auto-scaling

---

**Your app is ready to deploy! 🚀**
