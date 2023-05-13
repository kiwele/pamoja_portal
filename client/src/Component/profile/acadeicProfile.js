import * as React from "react";
import { useState, useEffect } from "react";
import { Box, ThemeProvider, Typography, createTheme } from "@mui/material";
import ImageAvatars from "../avatarImg";
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
import TextField from "@material-ui/core/TextField";
import AddIcon from '@mui/icons-material/Add';
import IconButton from '@mui/material/IconButton';
import CloseIcon from '@mui/icons-material/Close';
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

  const axiosPrivate = useAxiosPrivate();

  useEffect(() => {
    axiosPrivate("/get_academic_info").then((e) => {
      setData(e.data.data);

      // toast.success("updated successifully");
    });
  }, []);

  // handle form show and hiding
  const classes = useStyles();
  const [showForm, setShowForm] = useState(false);

  const handleShowForm = () => {
    setShowForm(true);
  };

  const handleHideForm = () => {
    setShowForm(false);
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
                </TableRow>
              </TableHead>
              <TableBody>
                {data.map((row) => (
                  <TableRow
                    key={row.school_names}
                    sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
                  >
                    <TableCell component="th" scope="row">
                      {row.school_names}
                    </TableCell>
                    <TableCell align="left">{row.study_taken}</TableCell>
                    <TableCell align="left">{row.award}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>

          <Box>
            <Box sx = {{
              display: 'flex',
              alignContent: 'left'
            }}>
              <Button
                size="small"
                // variant="contained"
                color="primary"
                onClick={handleShowForm}
              >
                <AddIcon/>
              </Button>
            </Box>

            {showForm && (
              <Paper className={classes.paper}>
                <div alignContent= "left">
                <IconButton color="primary" aria-label="add to shopping cart" onClick={handleHideForm}>
                      <CloseIcon/>
                   </IconButton>
                </div>
               
               <AddAcademicInfo/>
                
              </Paper>
            )}
          </Box>
        </box>
      </Box>
    </ThemeProvider>
  );
}
