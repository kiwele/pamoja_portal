import React, { useState, useEffect } from "react";
import MUIDataTable from "mui-datatables";
import { Button } from "@mui/material";
import { NavLink } from "react-router-dom";
import axios from "axios";
import useAxiosPrivate from "../hooks/useAxiosPrivate";
import useRefreshToken from "../hooks/useRefreshToken";
// import { toast } from "react-toastify";

const BASE_URL = process.env.BASE_URL;

const columns = [
  {
    name: "name",
    label: "Name",
    options: {
      filter: true,
      sort: true,
    },
  },
  {
    name: "email",
    label: "email",
    options: {
      filter: true,
      sort: false,
    },
  },
  {
    name: "phone",
    label: "Phone",
    options: {
      filter: true,
      sort: false,
    },
  },

  {
    name: "school",
    label: "school",
    options: {
      filter: true,
      sort: false,
    },
    
  },
  {
    name: "region",
    label: "Region",
    options: {
      filter: true,
      sort: false,
    },
    
  },
  {
    name: "activity",
    label: "Activity",
    options: {
      filter: true,
      sort: false,
    },
    
  },
  {
    name: "ID",
    label: "ID",
    options: {
      filter: true,
      sort: false,
    },
  },
 
];

const options = {
  filterType: "checkbox",
  tableBodyMaxHeight: "100%",
  responsive: "scroll",

  customToolbarSelect: (selectedRows, displayData, setSelectedRows) => {
    // console.log(selectedRows.data[0].index);
    console.log(displayData[0].data[6]);
    
  },
  customToolbar: () => {

  } ,
  serverSide: true
};


const UserDatatable = () => {
 const [data, setData] = useState()
 const axiosPrivate = useAxiosPrivate();
 const refresh = useRefreshToken();

 useEffect(() => {

  axiosPrivate('/members')
  // .
  // axios
  // .get("http://localhost:4000/members", {
  //   headers: {
  //     token: localStorage.getItem("token"),
  //   },
  //   withCredentials: true,
  // })
  .then((e) => {
    let dd = e.data.data;
    const neswData = dd.map(dt => (
     {
      name: dt.first_name + ' ' + dt.last_name,
      email: dt.email,
      phone: dt.phone_number,
      school: '',
      ID: dt.memberId

    }));
    setData(neswData)
    // toast.success("updated successifully");
  },)
}, []);


  

  return (
    <div>
      <Button>
        <NavLink
          className="navbar-item"
          activeClassName="is-active"
          to="/register_member"
        >
          add new
        </NavLink>
      </Button>

      <MUIDataTable
        title={"Members"}
        data={data}
        columns={columns}
        options={options}
      />

      <div>
        <button onClick={() => {refresh()}}>refresh</button>
      </div>
    </div>
  );
};

export default UserDatatable;
