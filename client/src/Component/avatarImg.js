import * as React from "react";
import Avatar from "@mui/material/Avatar";
import Stack from "@mui/material/Stack";
import { useEffect, useState } from "react";
import CameraAltOutlinedIcon from '@mui/icons-material/CameraAltOutlined';

import { toast } from "react-toastify";
import useAxiosPrivate from "../hooks/useAxiosPrivate";

export default function ImageAvatars({ height, width }) {
  const axiosPrivate = useAxiosPrivate();
  const [data, setData] = useState();

  useEffect(() => {
    axiosPrivate("/picture")
      .then((response) => {
        setData(response.data.profile_picture);
        toast.success("updated successifully");
      })
      .catch((e) => {
        toast.error("error");
      });
  }, []);

  return (
    <Stack direction="row" spacing={2}>
      <Avatar
        alt="User"
        sx={{ height: height, width: width }}
        src={`//localhost:4000/uploads/${data}`}
      >
        {/* <CameraAltOutlinedIcon/> */}
      </Avatar>
    </Stack>
  );
}
