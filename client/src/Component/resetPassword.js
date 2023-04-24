import * as React from "react";
import { useState } from "react";

import {  createTheme, ThemeProvider } from "@mui/material/styles";
import CssBaseline from "@mui/material/CssBaseline";
import Box from "@mui/material/Box";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { TextField } from "@material-ui/core";
import axios from "axios";
import { toast } from "react-toastify";
import Button from "@mui/material/Button";






const mdTheme = createTheme();

function RegisterBookContent() {
//   const dispatch = useDispatch();

  const [data, setData] = useState({ newPassword: "" });


  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData();

    formData.append("newPassword", data.newPassword);

    
    axios.post('http://localhost:4000/reset_password', formData, { 
     
        headers: {
       "token": localStorage.getItem("token")
     },
     withCredentials: true } 
   )
    .then((e)=> {
      toast.success('updated successifully')
    })
    .catch((e)=> {
      
      toast.error('error')
   
    })

  };

  return (
    <ThemeProvider theme={mdTheme}>
      <Grid container component="main" sx={{ height: "50vh" }}>
        <CssBaseline />

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
            {/* <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
              <LockOutlinedIcon />
            </Avatar> */}
            <Typography component="h1" variant="h5">
              RESET PASSWORD
            </Typography>
            <Box
              component="form"
              noValidate
              onSubmit={handleSubmit}
              sx={{ mt: 1 }}
            >
              <TextField
                margin="normal"
                required
                fullWidth
                id="newPassword"
                label="New Password"
                name="newPassword"
                autoComplete="text"
                autoFocus
                value={data.newPassword}
                onChange={(e) => setData({ ...data, newPassword: e.target.value })}
              />

              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
              >
                reset
              </Button>
              <Grid container>
                {/* <Grid item xs>
                  <Link href="#" variant="body2">
                    Forgot password?
                  </Link>
                </Grid> */}
                <Grid item>
                </Grid>
              </Grid>
              {/* <Copyright sx={{ mt: 5 }} /> */}
            </Box>
          </Box>
        </Grid>
      </Grid>
    </ThemeProvider>
  );
}

export default function ResetPassword() {
  return <RegisterBookContent />;
}
