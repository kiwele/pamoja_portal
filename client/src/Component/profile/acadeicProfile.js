import * as React from "react";
import { useState, useEffect } from "react";
import { Box, ThemeProvider, createTheme } from "@mui/material";
import { blue } from "@mui/material/colors";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import useAxiosPrivate from "../../hooks/useAxiosPrivate";
import { makeStyles } from "@material-ui/core/styles";
import Button from "@material-ui/core/Button";
import EditIcon from "@mui/icons-material/Edit";
import AddIcon from "@mui/icons-material/Add";
import IconButton from "@mui/material/IconButton";
import CloseIcon from "@mui/icons-material/Close";
import EditAcademics from "./editProfile/editAcademics";
import AddAcademicInfo from "../addAcademicInfo";

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

const theme = createTheme({
  palette: {
    background: {
      paper: "#fff",
    },
    text: {
      primary: "#173A5E",
      secondary: "#46505A",
    },
    action: {
      active: "#001E3C",
    },
    // success: {
    //   dark: '#009688',
    // },
  },
});

export default function AcademicProfile() {
  const [data, setData] = useState([]);
  const [showForm, setShowForm] = useState(false);
  const [showEditForm, setShowEditForm] = useState(false);
  const [rowData, setRowData] = useState({});
  
  const axiosPrivate = useAxiosPrivate();

  useEffect(() => {
    axiosPrivate("/get_academic_info").then((e) => {
      setData(e.data.data);
    });
  }, [showForm, showEditForm]);
  // showForm
  // handle form show and hiding
  const classes = useStyles();
 

  const handleShowForm = () => {
    setShowForm(true);
  };

  const handleHideForm = () => {
    setShowForm(false);
  };

  const handleShowEditForm = (r) => {
    console.log(r);
    setRowData(r);
    setShowEditForm(true);
  };

  const handleHideEditForm = () => {
    setShowEditForm(false);
  };

  return (
    <ThemeProvider theme={theme}>
      <Box
        sx={{
          bgcolor: "background.paper",
          boxShadow: 1,
          borderRadius: 2,
          p: 5,
          minWidth: 300,
          spacing: 8,
        }}
      >
        <box>
          <TableContainer component={Paper}>
            <Table
              sx={{ minWidth: 650 }}
              size="small"
              aria-label="a dense table"
            >
              <TableHead>
                <TableRow>
                  <TableCell> ACADEMIC INFORMATIONS</TableCell>
                </TableRow>
                <TableRow>
                  <TableCell> School name</TableCell>
                  {/* <TableCell align="right">School name</TableCell> */}
                  <TableCell align="left">Program</TableCell>
                  <TableCell align="left">award</TableCell>
                  <TableCell align="center">Action</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {data.map((row) => (
                  <TableRow
                    key={row.schoolId}
                    sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
                  >
                    <TableCell component="th" scope="row">
                      {row.school_names}
                    </TableCell>
                    <TableCell align="left">{row.study_taken}</TableCell>
                    <TableCell align="left">{row.award}</TableCell>
                    <TableCell align="center">
                      <IconButton
                        aria-label="edit"
                        size="small"
                        onClick={() => handleShowEditForm(row)}
                      >
                        <EditIcon />
                      </IconButton>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>

          <Box>
            <Box
              sx={{
                display: "flex",
                alignContent: "left",
              }}
            >
              <Button
                size="small"
                // variant="contained"
                color="primary"
                onClick={handleShowForm}
              >
                <AddIcon />
              </Button>
            </Box>

            {showForm && (
              <Paper className={classes.paper}>
                <div alignContent="left">
                  <IconButton
                    color="primary"
                    aria-label="add to shopping cart"
                    size="small"
                    onClick={handleHideForm}
                  >
                    <CloseIcon />
                  </IconButton>
                </div>

                <AddAcademicInfo handle = {handleHideForm}/>
              </Paper>
            )}
            {showEditForm && (
              <Paper className={classes.paper}>
                <div alignContent="left">
                  <IconButton
                    color="primary"
                    aria-label="add to shopping cart"
                    size="small"
                    onClick={handleHideEditForm}
                  >
                    <CloseIcon />
                  </IconButton>
                </div>
                <EditAcademics inputData={rowData} handle ={handleHideEditForm}/>
              </Paper>
            )}
          </Box>
        </box>
      </Box>
    </ThemeProvider>
  );
}
