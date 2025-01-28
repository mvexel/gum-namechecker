import express from "express";
import fetch from "node-fetch";

const app = express();
const port = 3000;

app.use(express.static("public"));
app.use(express.json());

app.post("/proxy", async (req, res) => {
  try {
    const response = await fetch(
      "https://edits.nationalmap.gov/apps/gaz-domestic/graphql",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "x-apollo-operation-name": "GazRecordPage_loadPage",
          "apollo-require-preflight": "true",
        },
        body: JSON.stringify(req.body),
      }
    );
    const data = await response.json();
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
