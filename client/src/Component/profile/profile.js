import * as React from "react";
import { useEffect, useState } from "react";
import {
  Box,
  ThemeProvider,
  Typography,
  colors,
  createTheme,
} from "@mui/material";
import ImageAvatars from "../avatarImg";
import { blue, red } from "@mui/material/colors";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@mui/material/Paper";
import IconButton from "@mui/material/IconButton";
import EditIcon from "@mui/icons-material/Edit";
import CloseIcon from "@mui/icons-material/Close";
import useAxiosPrivate from "../../hooks/useAxiosPrivate";
import EditPersonalInfo from "./editProfile/editPersonalInfo";

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

function createData(name, info) {
  return { name, info };
}

export default function Profile() {
  const [data, setData] = useState({});
  const axiosPrivate = useAxiosPrivate();

  // // handle form show and hiding
  const classes = useStyles();
  const [showForm, setShowForm] = useState(false);

  const handleShowForm = () => {
    setShowForm(true);
  };

  const handleHideForm = () => {
    setShowForm(false);
  };

  useEffect(() => {
    axiosPrivate("/personal_info").then(async (e) => {
      setData(e.data.data);
      // toast.success("updated successifully");
    });
  }, [showForm]);

  // const fullName =`${data?.first_name ?? " "} ${data?.last_name ?? " "}`;

  const firstName = data?.first_name;
const lastName = data?.last_name;
const fullName = firstName && lastName ? `${firstName} ${lastName}` : " ";

  // const fullName = data?.first_name + " " + data?.last_name;
  // let marital = data.maritalStatus.status_name;
  const rows = [
    createData("Full name", fullName),
    createData("Email", data.email),
    createData("Phone number", data.phone_number),
    createData("Gender", data.gender),
    createData("Marital status", data.maritalstatus?.status_name),
    createData(
      "Curent Region",
      data &&
        data.memberlocations &&
        data.memberlocations[0] &&
        data.memberlocations[0].region
    ),
  ];

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
        <Box
          sx={{
            display: "flex",
            justifyContent: "center",
          }}
        >
          <ImageAvatars height={150} width={150} />
        </Box>
        <Box
          sx={{
            display: "flex",
            justifyContent: "center",
            backgroundColor: blue,
            // color: blue,
          }}
        >
          <Typography>{fullName ? fullName : " "}</Typography>
        </Box>

        <Box>
        <TableContainer component={Paper}>
  <Table sx={{ minWidth: 200 }} size="small" aria-label="a dense table">
    <TableHead>
      <TableRow>
        <TableCell>PERSONAL INFORMATION</TableCell>
      </TableRow>
    </TableHead>
    <TableBody>
      {rows.length > 0 ? (
        rows.map((row) => (
          <TableRow
            key={row.name}
            sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
          >
            <TableCell component="th" scope="row">
              {row.name}
            </TableCell>
            <TableCell align="left">{row.info}</TableCell>
          </TableRow>
        ))
      ) : (
        <TableRow>
          <TableCell colSpan={2} align="center">
            No data available
          </TableCell>
        </TableRow>
      )}
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
              <IconButton aria-label="edit" onClick={handleShowForm}>
                <EditIcon />
              </IconButton>
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

                <EditPersonalInfo
                  showStatus={showForm}
                  inputData={data}
                  handle={handleHideForm}
                />
              </Paper>
            )}
          </Box>
        </Box>
      </Box>
    </ThemeProvider>
  );
}
