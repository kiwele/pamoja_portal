import React from "react";
import { useEffect, useState } from "react";
import {
  Box,
  ThemeProvider,
  Typography,
  colors,
  createTheme,
} from "@mui/material";

import CloseIcon from "@mui/icons-material/Close";
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
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@mui/material/Paper";
import useAxiosPrivate from "../../../hooks/useAxiosPrivate";
import Alert from "@mui/material/Alert";

function refreshPage() {
    window.location.reload();
  }

const useStyles = makeStyles((theme) => ({
  paper: {
    padding: theme.spacing(2),
    marginBottom: theme.spacing(2),
  },
  form: {
    display: "flex",
    flexDirection: "column",
    gap: theme.spacing(2),
  },
}));

function EditPersonalInfo({showStatus, inputData, handle}) {
    const [showAlert, setShowAlert] = useState({ status: false, severity : "", message : "" });
    const [selectedValue, setSelectedValue] = useState({ gender: "" });
    const [MaritalStatus, setMaritalStatus] = useState("");

  const [data, setData] = useState({
    fname: inputData?.first_name,
    lname: inputData?.middle_name,
    mname: inputData?.last_name,
    email: inputData?.email,
    phone: inputData?.phone_number,
    region: inputData?.memberLocations[0].region,
    gender: '',
  });



  const axiosPrivate = useAxiosPrivate();
    // handle form show and hiding
    const classes = useStyles();

  const handleAgeChange = (event) => {
    setMaritalStatus(event.target.value);
  };

  const handleShow = () => {
   return handle()
  }
  const handleChange = (event) => {
    setSelectedValue(event.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
  
  let id = inputData.memberId
  const formData = new FormData();

  formData.append("fname", data.fname);
  formData.append("mname", data.mname);
  formData.append("lname", data.lname);
  formData.append("email", data.email);
  formData.append("phone", data.phone);
  formData.append("region", data.region);
//   formData.append("gender", data.gender);
  formData.append("gender", selectedValue);
  formData.append("marital_Status", MaritalStatus);
  
  let info = {
    data, selectedValue, MaritalStatus
  }
  axiosPrivate
  .put(`/update_member/${id}`, info)
  .then((e) => {
    setShowAlert({...showAlert, status: true, message: 'updated successifully', severity: 'success'});
    setTimeout(() => {
      setShowAlert({...showAlert, status: false});
      handleShow()
    }, 2000);

  })
  .catch((e) => {
    console.log(e);
    setShowAlert({...showAlert, status: true, message: 'something went wrong', severity: 'error'});
    setTimeout(() => {
      setShowAlert({...showAlert, status: false});
      handleShow()
    }, 2000);
  });
};

  return (
    <div>
           {showAlert.status && (
        <Alert severity= {showAlert.severity}>{showAlert.message}</Alert>
      )}
        {inputData? (
             <Paper className={classes.paper}>
            
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
               {/* <TextField
                 type="password"
                 margin="normal"
                 required
                 id="password"
                 label="password"
                 name="password"
                 autoFocus
                 value={data.password}
                 onChange={(e) => setData({ ...data, password: e.target.value })}
               /> */}
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
   
               {/* <Input type="file" onChange={handleFileChange} /> */}
               <br />
               <Button
                 type="submit"
                 fullWidth
                 variant="contained"
                 sx={{ mt: 3, mb: 4 }}
               >
                 Update
               </Button>
             </Box>
           </Paper>
        ):(<div>Loading</div>)}
       
    </div>
  );
}

export default EditPersonalInfo;
