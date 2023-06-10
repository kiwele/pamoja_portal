import * as React from "react";
import { useState } from "react";

import { createTheme, ThemeProvider } from "@mui/material/styles";
import CssBaseline from "@mui/material/CssBaseline";
import Box from "@mui/material/Box";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { TextField } from "@material-ui/core";
import Button from "@mui/material/Button";
import useAxiosPrivate from "../hooks/useAxiosPrivate";
import Alert from "@mui/material/Alert";


const mdTheme = createTheme();

export default function AddAchievements({ handle }) {
  const [showAlert, setShowAlert] = useState({
    status: false,
    severity: "",
    message: "",
  });

  const axiosPrivate = useAxiosPrivate();

  const [file, setFile] = useState();
  const [data, setData] = useState({
    title: "",
    description: "",
  });

  const handleFileChange = (e) => {
    setFile(e.target.files[0]);
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData();

    formData.append("title", data.title);
    formData.append("description", data.description);
    formData.append("file", file);
    // formData.append("file", file);

    axiosPrivate
      .post("/add_projects", formData)
      .then((e) => {
             // set alert
             setShowAlert({
              ...showAlert,
              status: true,
              message: "project added successifully",
              severity: "success",
            });
            setTimeout(() => {
              setShowAlert({ ...showAlert, status: false });
              handle();
            }, 2000);
      })
      .catch((e) => {
        setShowAlert({
          ...showAlert,
          status: true,
          message: "something went wrong",
          severity: "error",
        });
        setTimeout(() => {
          setShowAlert({ ...showAlert, status: false });
          handle();
        }, 2000);
      });
  };

  return (
    <ThemeProvider theme={mdTheme}>
      <Grid container component="main" sx={{ height: "50vh" }}>
        <CssBaseline />

        {showAlert.status && (
        <Alert severity= {showAlert.severity}>{showAlert.message}</Alert>
      )}
        <Grid
          item
          xs={12}
          component={Paper}
        >
          <Box
            sx={{
              my: 8,
              mx: 4,
              display: "flex",
              flexDirection: "column",
              alignItems: "left",
            }}
          >
            <Typography component="h1" variant="h5">
               Achievements
            </Typography>
            <Box
              component="form"
              noValidate
              onSubmit={handleSubmit}
              // sx={{ mt: 1 }}
              sx={{
                "& > :not(style)": { m: 1, width: "25ch" },
              }}
            >
              <TextField
                margin="normal"
                required
                id="title"
                label="Title"
                name="title"
                autoComplete="text"
                autoFocus
                value={data.title}
                onChange={(e) =>
                  setData({ ...data, title: e.target.value })
                }
              />
              <TextField
                id="filled-multiline-flexible"
                label="Description"
                multiline
                maxRows={50}
                variant="filled"
                name="Description"
                autoComplete="text"
                autoFocus
                value={data.description}
                onChange={(e) => setData({ ...data, description: e.target.value })}
              />
              <input type="file" onChange={handleFileChange}/>
              <br />
              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 4 }}
              >
                Save
              </Button>
            </Box>
          </Box>
        </Grid>
      </Grid>
    </ThemeProvider>
  );
}
