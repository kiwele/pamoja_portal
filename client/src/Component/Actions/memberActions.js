import React from 'react'
import { Box, IconButton, Tooltip } from "@material-ui/core";
import PreviewIcon from '@mui/icons-material/Preview';
import DeleteOutlineOutlinedIcon from '@mui/icons-material/DeleteOutlineOutlined';

function MemberActions() {
  return (
    <div>
     <Box>
        <Tooltip title ="view member">
          <IconButton onClick={() => {}}>
            <PreviewIcon/>
          </IconButton>
        </Tooltip>
        <Tooltip title ="delete member">
          <IconButton onClick={() => {}}>
            <DeleteOutlineOutlinedIcon/>
          </IconButton>
        </Tooltip>
      </Box>
   </div>
  )
}

export default MemberActions