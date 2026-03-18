## Gemini Secrets — Instructor Guide

### Overview

Gemini Secrets is an interactive classroom game where students attempt to jailbreak a Gemini AI model to reveal hidden secret words.

This activity helps students learn:

- Prompt engineering  
- Prompt injection attacks  
- AI safety limitations  
- System vs. user instructions  

### Quick Start (Deployment)

Set your project and enable required services:

```bash
gcloud config set project YOUR_PROJECT_ID

gcloud services enable run.googleapis.com \
  cloudbuild.googleapis.com \
  aiplatform.googleapis.com \
  firestore.googleapis.com

gcloud auth application-default login
```

Build and deploy to Cloud Run:

```bash
gcloud builds submit --tag gcr.io/YOUR_PROJECT/gemini-secrets

gcloud run deploy gemini-secrets \
  --image gcr.io/YOUR_PROJECT/gemini-secrets \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

### Access Credentials

- **Student password**: `LEARNINGLAB2024`  
- **Instructor password**: `TEACHERMODE2026`  

### Running the Classroom Activity

#### Step 1 — Students play (about 20 minutes)

- Share the Cloud Run URL with students.  
- Students try to reach the highest level by getting the model to reveal secret words.  
- Encourage creative strategies, such as:
  - Roleplay scenarios  
  - Riddles and puzzles  
  - Indirect or multi-step prompts  

#### Step 2 — Group discussion (about 20 minutes)

Use discussion questions like:

- What worked well?  
- What failed or was blocked?  
- What surprised you about the model’s behavior?  
- Why do you think certain prompts bypassed protections?  

### Instructor Dashboard

To open the dashboard:

1. Open the Streamlit sidebar.  
2. Enter the instructor password.  

The dashboard shows:

- Number of active players  
- Levels reached  
- Number of attempts  
- Where most players are getting stuck  

You can use this information to:

- Identify struggling groups  
- Highlight strong strategies  
- Add a sense of friendly competition  

### Common Issues and Troubleshooting

1. **PermissionDenied (Vertex AI)**  
   - Make sure the correct project is set:  
     ```bash
     gcloud config set project YOUR_PROJECT_ID
     ```

2. **No leaderboard data**  
   - Ensure Firestore is created in **Native mode** in the same project.  

3. **App not loading or failing on Cloud Run**  
   - Check Cloud Run logs:  
     ```bash
     gcloud run services logs read gemini-secrets
     ```
