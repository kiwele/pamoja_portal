import React from "react";
import { useEffect, useState} from "react";
import {
  Box
} from "@mui/material";
import { TextField } from "@material-ui/core";
import Button from "@mui/material/Button";
import { makeStyles } from "@material-ui/core/styles";
import dayjs from 'dayjs';
import Paper from "@mui/material/Paper";
import useAxiosPrivate from "../../../hooks/useAxiosPrivate";
import Alert from "@mui/material/Alert";
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';

function refreshPage() {
    window.location.reload(false);
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

function EditAcademics({inputData, handle}) {
    const [showAlert, setShowAlert] = useState({ status: false, severity : "", message : "" });

  const axiosPrivate = useAxiosPrivate();
    // handle form show and hiding
    const classes = useStyles();

    const [data, setData] = useState({
      schoolName: inputData?.school_names,
      program: inputData?.study_taken,
      award: inputData?.award,
      startDate: "",
      endDate: "",
    });
    const [value, setValue] = useState(dayjs('2022-04-17'));
  
    const handleSubmit = (e) => {
      e.preventDefault();
  
      const formData = new FormData();
  
      formData.append("schoolName", data.schoolName);
      formData.append("program", data.program);
      formData.append("award", data.award);
      formData.append("startDate", data.startDate);
      formData.append("endDate", data.endDate);
      // formData.append("file", file);

      console.log(data);
      let id = inputData.schoolId;
      axiosPrivate
        .put(`/update_academic_info/${id}`, data)
        .then((e) => {
            setShowAlert({
              ...showAlert,
              status: true,
              message: "academic detail updated successifully ",
              severity: "success",
            });
            setTimeout(() => {
              setShowAlert({ ...showAlert, status: false });
              handle()
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
            handle()
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
              onSubmit={handleSubmit }
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
                value={data.schoolName}
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
                name="Program"
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
                Update
              </Button>
            </Box>
           </Paper>
        ):(<div>Loading...</div>)}
       
    </div>
  );
}

export default EditAcademics;
