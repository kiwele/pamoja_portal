import * as React from "react";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
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
import IconButton from "@mui/material/IconButton";
import EditIcon from "@mui/icons-material/Edit";
import Paper from "@mui/material/Paper";
import useAxiosPrivate from "../../hooks/useAxiosPrivate";

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

export default function MemberPersonalInfo() {
  const [data, setData] = useState({});
  let { id } = useParams();

  const axiosPrivate = useAxiosPrivate();

  useEffect(() => {
    axiosPrivate(`/get_member_personal_info/${id}`).then(async (e) => {
      setData(e.data.data);
      // toast.success("updated successifully");
    });
  }, []);

  // const fullName = data.first_name + " " + data.last_name;
  const firstName = data?.first_name;
  const lastName = data?.last_name;
  const fullName = firstName && lastName ? `${firstName} ${lastName}` : "";

  const rows = [
    createData("Full name", fullName),
    createData("Email", data.email),
    createData("Phone number", data.phone_number),
    createData("Gender", data.gender),
    createData("Marital status", "Single"),
    createData("Curent Region", "Dar es salaam"),
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
            <Table
              sx={{ minWidth: 200 }}
              size="small"
              aria-label="a dense table"
            >
              <TableHead>
                <TableRow>
                  <TableCell> PERSONAL INFORMATIONS</TableCell>
                  {/* <TableCell align="right"></TableCell> */}
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
      
        </Box>
 
      </Box>
    </ThemeProvider>
  );
}
