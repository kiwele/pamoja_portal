import * as React from "react";
import { useState } from "react";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import CssBaseline from "@mui/material/CssBaseline";
import Box from "@mui/material/Box";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import axios from "axios";
import { toast } from "react-toastify";
import Button from "@mui/material/Button";
import Input from "@mui/material/Input";
import useAxiosPrivate from "../hooks/useAxiosPrivate";
import Alert from "@mui/material/Alert";


const mdTheme = createTheme();

function  refreshPage(){
  window.location.reload()
}

function RegisterBookContent() {
  const axiosPrivate = useAxiosPrivate();

  const [file, setFile] = useState();
  const [showAlert, setShowAlert] = useState({
    status: false,
    severity: "",
    message: "",
  });

  const handleFileChange = (e) => {
    setFile(e.target.files[0]);
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData();

    formData.append("file", file);

    axiosPrivate.post("/update_picture", formData)
      .then((e) => {
                // set alert
                setShowAlert({
                  ...showAlert,
                  status: true,
                  message: "picture updated successifully",
                  severity: "success",
                });
                setTimeout(() => {
                  setShowAlert({ ...showAlert, status: false });
                  refreshPage();
                }, 2000);

      
      })
      .catch((e) => {
             // set alert
             setShowAlert({
              ...showAlert,
              status: true,
              message: "something went wrong",
              severity: "error",
            });
            setTimeout(() => {
              setShowAlert({ ...showAlert, status: false });
              refreshPage();
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
          sm={8}
          md={12}
          component={Paper}
          elevation={6}
          square
        >
          <Box
            sx={{
              my: 8,
              mx: 4,
              display: "flex",
              flexDirection: "column",
              alignItems: "center",
            }}
          >
            <Typography component="h1" variant="h5">
              UPLOAD PROFILE PICTURE
            </Typography>
            <Box
              component="form"
              noValidate
              onSubmit={handleSubmit}
              sx={{ mt: 1 }}
            >
              <Input type="file" onChange={handleFileChange} />

              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
              >
                Upload
              </Button>
              <Grid container>
                <Grid item></Grid>
              </Grid>
            </Box>
          </Box>
        </Grid>
      </Grid>
    </ThemeProvider>
  );
}

export default function AddProfilePicture() {
  return <RegisterBookContent />;
}
