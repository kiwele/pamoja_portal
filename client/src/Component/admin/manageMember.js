import React from "react";
import { useState } from "react";
import { useParams } from "react-router-dom";
import FormControl from "@mui/material/FormControl";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import Select from "@mui/material/Select";
import { Typography } from "@material-ui/core";
import { Box } from "@mui/material";
import Button from "@mui/material/Button";
import useAxiosPrivate from "../../hooks/useAxiosPrivate";
import Alert from "@mui/material/Alert";

function ManageMember() {
  const [showAlert, setShowAlert] = useState({ status: false, severity : "", message : "" });
  const [Level, setLevel] = useState("");
  const [status, setStatus] = useState("");
  
  let { id } = useParams();
  const axiosPrivate = useAxiosPrivate();

  const handleLevelChange = (event) => {
    setLevel(event.target.value);
  };

  const handleStatusChange = (event) => {
    setStatus(event.target.value);
  };

  const handlesubmit = (e) => {
    e.preventDefault();
    console.log('nimeitwa');
    
    console.log(Level, status);

    axiosPrivate
      .post(`/manage/${id}`, { Level, status })
      .then((e) => {
        setShowAlert({...showAlert, status: true, message: 'statuses updated successifully', severity: 'success'});
        setTimeout(() => {
          setShowAlert({...showAlert, status: false});
        }, 2000);
        // console.log(e);
      })
      .catch((e) => {
        setShowAlert({...showAlert, status: true, message: 'something went wrong', severity: 'error'});
        setTimeout(() => {
          setShowAlert({...showAlert, status: false});
        }, 2000);
      });
  };

  return (
    <div>
        {showAlert.status && (
        <Alert severity= {showAlert.severity}>{showAlert.message}</Alert>
      )}
      <Box
        component="form"
        onSubmit={handlesubmit}
        sx={{
          bgcolor: "background.paper",
          boxShadow: 1,
          borderRadius: 2,
          p: 5,
          minWidth: 200,
          spacing: 8,
          '@media screen and (max-width: 600px)': {
            minWidth: '100%',
            p: 3,
          },
        }}
      >
        <Typography>Manage Member</Typography>

        <FormControl variant="standard" sx={{ m: 1, ml: 3, minWidth: 120 }}>
          <InputLabel id="demo-simple-select-standard-label">Level</InputLabel>
          <Select
            labelId="demo-simple-select-standard-label"
            id="demo-simple-select-standard"
            value={Level}
            onChange={handleLevelChange}
          >
            <MenuItem value=""></MenuItem>
            <MenuItem value={1}>Junior</MenuItem>
            <MenuItem value={2}>Intermidiate</MenuItem>
            <MenuItem value={3}>Graduate</MenuItem>
            <MenuItem value={4}>Senior</MenuItem>
          </Select>
        </FormControl>

        <FormControl variant="standard" sx={{ m: 1, minWidth: 120 }}>
          <InputLabel id="demo-simple-select-standard-label">Status</InputLabel>
          <Select
            labelId="demo-simple-select-standard-label"
            id="demo-simple-select-standard"
            value={status}
            onChange={handleStatusChange}
          >
            <MenuItem value=""></MenuItem>
            <MenuItem value={1}>Active</MenuItem>
            <MenuItem value={2}>Normal</MenuItem>
            <MenuItem value={3}>Inactive</MenuItem>
          </Select>
        </FormControl>

        <Button type="submit" variant="contained" sx={{ mt: 3, mb: 4 }}>
          Save
        </Button>
      </Box>
    </div>
  );
}

export default ManageMember;
