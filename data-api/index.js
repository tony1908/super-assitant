const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');
import { Database } from "@tableland/sdk";
import { request, gql, GraphQLClient } from 'graphql-request';

const app = express();
app.use(bodyParser.json());

// SQLite database setup
const db = new sqlite3.Database('your_database.db');

app.post('/query-tableland', async (req, res) => {
  const query = req.body.query; // Get the query from the request body

  if (!query) {
    return res.status(400).json({ error: 'Query is missing in the request body' });
  }

  const tableName: string = "dao_conference_votes_11155111_293"; // Our pre-defined health check table

    interface HealthBot {
        counter: number;
    }

    const db: Database<HealthBot> = new Database();


    const { results } = await db.prepare(query).all();
    res.json({ results: results });


});

app.post('/query-thegraph', async (req, res) => {
  const query = req.body.query; // Get the query from the request body

  if (!query) {
    return res.status(400).json({ error: 'Query is missing in the request body' });
  }

  const graphQLClient = new GraphQLClient('https://gateway.thegraph.com/api//subgraphs/id/', {
    });

    const results = await graphQLClient.request(query);
    res.json({ results: results });


});

// Start the Express server
const port = 3000;
app.listen(port, () => {
  console.log(`Express server is running on port ${port}`);
});
