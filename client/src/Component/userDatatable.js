import React, { useState, useEffect } from "react";
import MUIDataTable from "mui-datatables";
import { Button } from "@mui/material";
import { NavLink } from "react-router-dom";
import axios from "axios";
import useAxiosPrivate from "../hooks/useAxiosPrivate";
import useRefreshToken from "../hooks/useRefreshToken";
import { Box } from "@material-ui/core";
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



const UserDatatable = () => {
 const [memberId, setMemberId] = useState() 
 const [data, setData] = useState()
 const axiosPrivate = useAxiosPrivate();

 const options = {
  search: true,
  deleting: true,
  filterType: "checkbox",
  tableBodyMaxHeight: "100%",
  responsive: "scroll",

  customToolbarSelect: (selectedRows, displayData, setSelectedRows) => {
    // console.log(selectedRows.data[0].index);
    console.log(displayData[0].data[6]);
    setMemberId(displayData[0].data[6]);
    
  },
  customSearch: (searchQuery, currentRow, columns) => {
    return  true
     },
  customToolbar: ({displayData}) => {

     },
  serverSide: true,


  // new options
  textLabels: {
    body: {
      noMatch: "Sorry, no matching records found",
      toolTip: "Sort",
      columnHeaderTooltip: column => `Sort for ${column.label}`
    },
    pagination: {
      next: "Next Page",
      previous: "Previous Page",
      rowsPerPage: "Rows per page:",
      displayRows: "of",
    },
    toolbar: {
      search: "Search",
      downloadCsv: "Download CSV",
      print: "Print",
      viewColumns: "View Columns",
      filterTable: "Filter Table",
    },
    filter: {
      all: "All",
      title: "FILTERS",
      reset: "RESET",
    },
    viewColumns: {
      title: "Show Columns",
      titleAria: "Show/Hide Table Columns",
    },
    selectedRows: {
      text: "row(s) selected",
      delete: "Delete",
      deleteAria: "Delete Selected Rows",
    },
  }
  // end options
};



 useEffect(() => {

  axiosPrivate('/members')
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


     <Box>
     <MUIDataTable
        size="small"
        title={"Members"}
        data={data}
        columns={columns}
        options={options}
      />
     </Box>
 

    </div>
  );
};

export default UserDatatable;
