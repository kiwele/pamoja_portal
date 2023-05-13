import React, { useState, useEffect } from "react";
import useAxiosPrivate from "../hooks/useAxiosPrivate";
import axios from "../axios";
import { DataGrid } from "@mui/x-data-grid";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
import { NavLink, Navigate } from "react-router-dom";
import { Box, IconButton, Tooltip } from "@material-ui/core";
import Alert from '@mui/material/Alert';
import PreviewIcon from '@mui/icons-material/Preview';
import DeleteOutlineOutlinedIcon from '@mui/icons-material/DeleteOutlineOutlined';
import { red } from "@mui/material/colors";
import MemberActions from "./Actions/memberActions";

function refreshPage() {
  window.location.reload();
}



export default function DataTable() {
  const [showAlert, setShowAlert] = useState(false);
  const [data, setData] = useState();
  const axiosPrivate = useAxiosPrivate();

  function deleteMember(id) {
    axios.post(`/delete_member/${id}`).then( async(e) => {
      setShowAlert(true);
      setTimeout(() => 
      {
      setShowAlert(false);
      refreshPage()      
      }, 2000);
      // toast.success("updated successifully");
    });
  }
  
  const columns = [
    { field: "id", headerName: "ID", width: 70, hide: true },
    { field: "name", headerName: "Full name", width: 160 },
    { field: "email", headerName: "Email", width: 160 },
    {
      field: "phone",
      headerName: "Phone number",
      type: "number",
      width: 130,
    },
    {
      field: "school",
      headerName: "School",
      width: 160,
    },
    {
      field: "status",
      headerName: "Status",
      width: 90,
    },
    // {
    //   field: 'fullName',
    //   headerName: 'Full name',
    //   description: 'This column has a value getter and is not sortable.',
    //   sortable: false,
    //   width: 160,
    //   valueGetter: (params) =>
    //     `${params.row.firstName || ''} ${params.row.lastName || ''}`,
    // },
    {
      field: "action",
      headerName: "Actions",
      type: "actions",
      width: 200,
      renderCell: (params) => (
        // <MemberActions/>
        <>
          <a style={{ color: 'primary', backgroundColor: red }} href={`/member/${params.row.id}`}>view</a>
          <Button onClick={ () => deleteMember(params.row.id)}>delete</Button>
        </>
      ),
      sortable: false,
      filterable: false,
    },
  ];


  useEffect(() => {
    axiosPrivate("/members").then((e) => {
      let dd = e.data.data;
      const neswData = dd.map((dt) => ({
        id: dt.memberId,
        name: dt.first_name + " " + dt.last_name,
        email: dt.email,
        phone: dt.phone_number,
        school: "Kichangachui",
        status: dt.activeStatus ? dt.activeStatus.status_name : "",
      }));
      console.log(dd);
      setData(neswData);
      // toast.success("updated successifully");
    });
  }, []);

  return (
    <div style={{ height: 400, width: "100%" }}>
        {showAlert && (
        <Alert severity="success">User deleted successfully</Alert>
      )}
      <Box>
        <Button>
          <NavLink
            className="navbar-item"
            activeClassName="is-active"
            to="/admin_register_member"
          >
            add new
          </NavLink>
        </Button>
      </Box>
      {data ? (
        <DataGrid
          rows={data}
          columns={columns}
          paginationModel={{ page: 0, pageSize: 5 }}
          // checkboxSelection
        />
      ) : (
        <p>data loading ....</p>
      )}
    </div>
  );
}
