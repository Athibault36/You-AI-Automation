import fs from "fs";
import { google } from "googleapis";

// Rehydrate client_secret.json from GitHub secret
fs.writeFileSync("client_secret.json", process.env.CLIENT_SECRET_JSON);

// Parse credentials
const { client_id, client_secret } = JSON.parse(fs.readFileSync("client_secret.json")).installed;
const oauth2Client = new google.auth.OAuth2(client_id, client_secret, "https://developers.google.com/oauthplayground");
oauth2Client.setCredentials({ refresh_token: process.env.YT_REFRESH_TOKEN });

const youtube = google.youtube({ version: "v3", auth: oauth2Client });

// Inputs (from workflow): videoPath, title, description, tags
const [videoPath, title, description, tagsRaw] = process.argv.slice(2);
const tags = tagsRaw.split(",");

async function uploadVideo() {
  const res = await youtube.videos.insert({
    part: ["snippet", "status"],
    requestBody: {
      snippet: { title, description, tags, categoryId: "27" },
      status: { privacyStatus: "public" }
    },
    media: { body: fs.createReadStream(videoPath) }
  });
  console.log("✅ Uploaded Video ID:", res.data.id);
}

uploadVideo().catch(console.error);
