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
import Radio from "@mui/material/Radio";
import RadioGroup from "@mui/material/RadioGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import FormControl from "@mui/material/FormControl";
import FormLabel from "@mui/material/FormLabel";
import MenuItem from "@mui/material/MenuItem";
import Select from "@mui/material/Select";
import InputLabel from "@mui/material/InputLabel";
import useAxiosPrivate from "../hooks/useAxiosPrivate";
import Alert from "@mui/material/Alert";

const mdTheme = createTheme();

function Register() {
  const [showAlert, setShowAlert] = useState({ status: false, severity : "", message : "" });
  const axiosPrivate = useAxiosPrivate();

  // const [file, setFile] = useState();
  const [data, setData] = useState({
    fname: "",
    lname: "",
    mname: "",
    email: "",
    password: "",
    phone: "",
    region: "",
    parentName: "",
    parentPhone: "",
    gender: "",
  });

  const [selectedValue, setSelectedValue] = useState({ gender: "" });
  const [MaritalStatus, setMaritalStatus] = useState("");

  const handleAgeChange = (event) => {
    setMaritalStatus(event.target.value);
  };

  const handleChange = (event) => {
    setSelectedValue(event.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData();

    formData.append("fname", data.fname);
    formData.append("mname", data.mname);
    formData.append("lname", data.lname);
    formData.append("email", data.email);
    formData.append("password", data.password);
    formData.append("phone", data.phone);
    formData.append("region", data.region);
    formData.append("parentName", data.parentName);
    formData.append("parentPhone", data.parentPhone);
    formData.append("gender", data.gender);
    formData.append("gender", selectedValue);
    formData.append("marital_Status", MaritalStatus);

    axiosPrivate
      .post("/register_member", formData)
      .then((e) => {
        // set alert
        setShowAlert({...showAlert, status: true, message: 'registered successifully', severity: 'success'});
        setTimeout(() => {
          setShowAlert({...showAlert, status: false});
        }, 2000);

      // Reset form fields
      setData({
        fname: "",
        lname: "",
        mname: "",
        email: "",
        password: "",
        phone: "",
        region: "",
        parentName: "",
        parentPhone: "",
        gender: "",
      });
      setSelectedValue({ gender: "" });
      setMaritalStatus("");

      })
      .catch((e) => {
        setShowAlert({...showAlert, status: true, message: 'something went wrong', severity: 'error'});
        setTimeout(() => {
          setShowAlert({...showAlert, status: false});
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
              Personal Informations
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
                id="fname"
                label="First name"
                name="fname"
                autoComplete="text"
                autoFocus
                value={data.fname}
                onChange={(e) => setData({ ...data, fname: e.target.value })}
              />
              <TextField
                margin="normal"
                required
                fullWidth
                id="mname"
                label="Middle name"
                name="mname"
                autoComplete="text"
                autoFocus
                value={data.mname}
                onChange={(e) => setData({ ...data, mname: e.target.value })}
              />
              <TextField
                margin="normal"
                required
                id="lname"
                label="Last name"
                name="lname"
                autoComplete="text"
                autoFocus
                value={data.lname}
                onChange={(e) => setData({ ...data, lname: e.target.value })}
              />
              <TextField
                margin="normal"
                required
                id="email"
                label="Email"
                name="email"
                autoComplete="text"
                autoFocus
                value={data.email}
                onChange={(e) => setData({ ...data, email: e.target.value })}
              />
              <TextField
                type="password"
                margin="normal"
                required
                id="password"
                label="password"
                name="password"
                autoFocus
                value={data.password}
                onChange={(e) => setData({ ...data, password: e.target.value })}
              />
              <TextField
                margin="normal"
                required
                id="phone"
                label="Phone number"
                name="phone"
                autoComplete="number"
                autoFocus
                value={data.phone}
                onChange={(e) => setData({ ...data, phone: e.target.value })}
              />
              <TextField
                margin="normal"
                required
                id="region"
                label="Curent region"
                name="region"
                autoComplete="text"
                autoFocus
                value={data.region}
                onChange={(e) => setData({ ...data, region: e.target.value })}
              />
              

              <FormControl>
                <FormLabel id="demo-row-radio-buttons-group-label">
                  Gender
                </FormLabel>
                <RadioGroup
                  row
                  aria-labelledby="demo-row-radio-buttons-group-label"
                  name="row-radio-buttons-group"
                >
                  <FormControlLabel
                    onChange={handleChange}
                    value="female"
                    control={<Radio />}
                    label="Female"
                  />
                  <FormControlLabel
                    onChange={handleChange}
                    value="male"
                    control={<Radio />}
                    label="Male"
                  />
                </RadioGroup>
              </FormControl>

              <FormControl variant="standard" sx={{ m: 1, minWidth: 120 }}>
                <InputLabel id="demo-simple-select-standard-label">
                  Marital Status
                </InputLabel>
                <Select
                  labelId="demo-simple-select-standard-label"
                  id="demo-simple-select-standard"
                  value={MaritalStatus}
                  onChange={handleAgeChange}
                  label="Age"
                >
                  <MenuItem value=""></MenuItem>
                  <MenuItem value={1}>Single</MenuItem>
                  <MenuItem value={2}>Maried</MenuItem>
                  <MenuItem value={3}>Divorced</MenuItem>
                </Select>
              </FormControl>

              <TextField
                margin="normal"
                required
                id="parentName"
                label="Parent Name"
                name="parentName"
                autoComplete="text"
                autoFocus
                value={data.parentName}
                onChange={(e) => setData({ ...data, parentName: e.target.value })}
              />
               <TextField
                margin="normal"
                required
                id="parentPhone"
                label="Parent phone"
                name="parentPhone"
                autoComplete="text"
                autoFocus
                value={data.parentPhone}
                onChange={(e) => setData({ ...data, parentPhone: e.target.value })}
              />

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

export default function RegisterMemberForm() {
  return <Register />;
}
