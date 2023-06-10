import * as React from "react";
import { useState } from "react";

import { createTheme, ThemeProvider } from "@mui/material/styles";
import CssBaseline from "@mui/material/CssBaseline";
import Box from "@mui/material/Box";
import Typography from "@mui/material/Typography";
import Grid from "@mui/material/Grid";
import Paper from "@mui/material/Paper";
import { TextField } from "@material-ui/core";
import dayjs from 'dayjs';
import { DemoContainer } from '@mui/x-date-pickers/internals/demo';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import axios from "axios";
import { toast } from "react-toastify";
import Button from "@mui/material/Button";
import Input from "@mui/material/Input";
import useAxiosPrivate from "../hooks/useAxiosPrivate";
import Alert from "@mui/material/Alert";

function refreshPage() {
  window.location.reload();
}


const mdTheme = createTheme();

function AcademicInfo({handle}) {
  const [showAlert, setShowAlert] = useState({
    status: false,
    severity: "",
    message: "",
  });
  const axiosPrivate = useAxiosPrivate();

  const [data, setData] = useState({
    schoolName: "",
    program: "",
    award: "",
    startDate: "",
    endDate: "",
  });
  const [value, setValue] = useState(dayjs('2022-04-17'));

  const handleFicha = () => {
    handle();
  }
  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData();

    formData.append("schoolName", data.schoolName);
    formData.append("program", data.program);
    formData.append("award", data.award);
    formData.append("startDate", data.startDate);
    formData.append("endDate", data.endDate);
    // formData.append("file", file);

    axiosPrivate
      .post("/academic_info", formData)
      .then((e) => {
          // set alert
          setShowAlert({
            ...showAlert,
            status: true,
            message: "academic detail added successifully ",
            severity: "success",
          });
          setTimeout(() => {
            setShowAlert({ ...showAlert, status: false });
            handleFicha()
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
          // refreshPage();
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
          // sm={8}
          // md={12}
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
              Academic Informations
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
                fullWidth
                id="schoolName"
                label="School name"
                name="schoolName"
                autoComplete="text"
                autoFocus
                value={data.fname}
                onChange={(e) =>
                  setData({ ...data, schoolName: e.target.value })
                }
              />
              <TextField
                margin="normal"
                required
                fullWidth
                id="mname"
                label="Program"
                name="mname"
                autoComplete="text"
                autoFocus
                value={data.program}
                onChange={(e) => setData({ ...data, program: e.target.value })}
              />
              <TextField
                margin="normal"
                required
                id="award"
                label="Award"
                name="award"
                autoComplete="text"
                autoFocus
                value={data.award}
                onChange={(e) => setData({ ...data, award: e.target.value })}
              />

              <LocalizationProvider dateAdapter={AdapterDayjs}>
                  <DatePicker
                    label="Start date"
                    value='20'
                    onChange={(newValue) => setValue(newValue)}
                  />
              </LocalizationProvider>
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

export default function AddAcademicInfo({ handle }) {
  return <AcademicInfo handle={handle} />;
}
