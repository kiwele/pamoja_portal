import * as React from "react";
import Avatar from "@mui/material/Avatar";
import Stack from "@mui/material/Stack";
import { useEffect, useState } from "react";

import { toast } from "react-toastify";
import useAxiosPrivate from "../hooks/useAxiosPrivate";

export default function ImageAvatars({ height, width }) {
  const axiosPrivate = useAxiosPrivate();
  const [data, setData] = useState();

  useEffect(() => {
    axiosPrivate("/picture")
      .then((response) => {
        setData(response.data.profile_picture);
      })
      .catch((e) => {
        toast.error("error");
      });
  }, []);


  return (
    <Stack direction="row" spacing={2}>

      {data ? (
          <Avatar
          alt="User"
          sx={{ height: height, width: width }}
          src={`//localhost:5000/uploads/${data}`}
        />
        ) :
        (
          <Avatar
          alt="User"
          sx={{ height: height, width: width }}
        >
        </Avatar>
        )
      }
   
    </Stack>
  );
}
