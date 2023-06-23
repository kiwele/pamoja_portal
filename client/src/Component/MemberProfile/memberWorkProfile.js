import * as React from "react";
import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { Box, ThemeProvider, createTheme } from "@mui/material";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import useAxiosPrivate from "../../hooks/useAxiosPrivate";
import { makeStyles } from "@material-ui/core/styles";

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

export default function MemberWorkProfile() {
  const [data, setData] = useState([]);

  let { id } = useParams();
  const axiosPrivate = useAxiosPrivate();
  const classes = useStyles();
  const [showForm, setShowForm] = useState(false);

  useEffect(() => {
    axiosPrivate(`/get_member_working_info/${id}`).then((e) => {
      setData(e.data.data);
    });
  }, []);

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
              sx={{ minWidth: 200 }}
              size="small"
              aria-label="a dense table"
            >
              <TableHead>
                <TableRow>
                  <TableCell> WORKING EXPERIENCE</TableCell>
                </TableRow>
                <TableRow>
                  <TableCell> Organization</TableCell>
                  <TableCell align="left">Positin Title</TableCell>
                  <TableCell align="left">Time</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {data.map((row) => (
                  <TableRow
                    key={row.organization}
                    sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
                  >
                    <TableCell component="th" scope="row">
                      {row.organization}
                    </TableCell>
                    <TableCell align="left">{row.position_title}</TableCell>
                    <TableCell align="left">{row.start_date}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
        </Box>
      </Box>
    </ThemeProvider>
  );
}
