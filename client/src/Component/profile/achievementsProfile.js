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
import Button from "@material-ui/core/Button";
import AddIcon from "@mui/icons-material/Add";
import IconButton from "@mui/material/IconButton";
import CloseIcon from "@mui/icons-material/Close";
import { makeStyles } from "@material-ui/core/styles";
import AddWorkExperience from "../workExperience";
import AddAchievements from "../AddAchievements";

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

export default function Achievementsfile() {
  const [data, setData] = useState([]);

  const axiosPrivate = useAxiosPrivate();
  const classes = useStyles();
  const [showForm, setShowForm] = useState(false);

  const handleShowForm = () => {
    setShowForm(true);
  };

  const handleHideForm = () => {
    setShowForm(false);
  };

  useEffect(() => {
    axiosPrivate("/projects").then((e) => {
      console.log("hapa");
      console.log(e.data.data);
      setData(e.data.data);
    });
  }, [showForm]);

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
        <Box>
          <TableContainer component={Paper}>
            <Table
              sx={{ minWidth: 650 }}
              size="small"
              aria-label="a dense table"
            >
              <TableHead>
                <TableRow>
                  <TableCell>PROJECTS ACHIEVED</TableCell>
                </TableRow>
                <TableRow>
                  <TableCell>Project title</TableCell>
                  <TableCell align="left">Short description</TableCell>
                  <TableCell align="left">Actions</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {data.map((row) => (
                  <TableRow
                    key={row.projectId}
                    sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
                  >
                    <TableCell component="th" scope="row">
                      {row.title}
                    </TableCell>
                    <TableCell align="left">{row.description}</TableCell>
                    <TableCell align="left">view</TableCell>
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
                    onClick={handleHideForm}
                  >
                    <CloseIcon />
                  </IconButton>
                </div>

                <AddAchievements handle={handleHideForm} />
              </Paper>
            )}
          </Box>
        </Box>
      </Box>
    </ThemeProvider>
  );
}
