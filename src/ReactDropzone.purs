module Bindings.ReactDropzone
     ( Props
     , dropzone
     , dropzoneDefaultProps

     , Bytes
     , toBytes
     , bytesInfinity
     ) where

import Prelude

import Data.Maybe (Maybe (..))
import Data.Nullable (Nullable, toNullable)

import Effect.Uncurried (EffectFn2, EffectFn3)

import Web.File.File (File)
import React (ReactClass, SyntheticEventHandler, Children)
import React.SyntheticEvent (SyntheticMouseEvent)


newtype Bytes = Bytes Int
foreign import bytesInfinity :: Bytes

toBytes :: Int -> Bytes
toBytes = Bytes

type Props props inputProps
           style activeStyle acceptStyle rejectStyle disabledStyle =
   { accept                :: Nullable String -- PropTypes.string
   -- children: PropTypes.oneOfType([PropTypes.node, PropTypes.func])
   , disableClick          :: Boolean -- PropTypes.bool
   , disabled              :: Boolean -- PropTypes.bool
   , disablePreview        :: Boolean -- PropTypes.bool
   , preventDropOnDocument :: Boolean -- PropTypes.bool
   , inputProps            :: Nullable (Record inputProps) -- PropTypes.object
   , multiple              :: Boolean -- PropTypes.bool
   , name                  :: Nullable String -- PropTypes.string
   , maxSize               :: Bytes -- PropTypes.number
   , minSize               :: Bytes -- PropTypes.number
   , className             :: Nullable String -- PropTypes.string
   , activeClassName       :: Nullable String -- PropTypes.string
   , acceptClassName       :: Nullable String -- PropTypes.string
   , rejectClassName       :: Nullable String -- PropTypes.string
   , disabledClassName     :: Nullable String -- PropTypes.string
   , style                 :: Nullable (Record style) -- PropTypes.object
   , activeStyle           :: Nullable (Record activeStyle) -- PropTypes.object
   , acceptStyle           :: Nullable (Record acceptStyle) -- PropTypes.object
   , rejectStyle           :: Nullable (Record rejectStyle) -- PropTypes.object

   , disabledStyle         :: Nullable (Record disabledStyle)
                           -- PropTypes.object

   , onClick               :: Nullable
                                (SyntheticEventHandler SyntheticMouseEvent)
                           -- PropTypes.func

   , onDrop                :: Nullable ( EffectFn3 (Array File)
                                                   (Array File)
                                                   SyntheticMouseEvent
                                                   Unit
                                       ) -- PropTypes.func

   , onDropAccepted        :: Nullable ( EffectFn2 (Array File)
                                                   SyntheticMouseEvent
                                                   Unit
                                       ) -- PropTypes.func

   , onDropRejected        :: Nullable ( EffectFn2 (Array File)
                                                   SyntheticMouseEvent
                                                   Unit
                                       ) -- PropTypes.func

   , onDragStart           :: Nullable
                                (SyntheticEventHandler SyntheticMouseEvent)
                           -- PropTypes.func

   , onDragEnter           :: Nullable
                                (SyntheticEventHandler SyntheticMouseEvent)
                           -- PropTypes.func

   , onDragOver            :: Nullable
                                (SyntheticEventHandler SyntheticMouseEvent)
                           -- PropTypes.func

   , onDragLeave           :: Nullable
                                (SyntheticEventHandler SyntheticMouseEvent)
                           -- PropTypes.func

   , onFileDialogCancel    :: Nullable (SyntheticEventHandler Unit)
                           -- PropTypes.func

   | props
   }

dropzoneDefaultProps :: Props () () () () () () ()
dropzoneDefaultProps =
  { accept                : toNullable Nothing
  , disableClick          : false
  , disabled              : false
  , disablePreview        : false
  , preventDropOnDocument : true
  , inputProps            : toNullable Nothing
  , multiple              : true
  , name                  : toNullable Nothing
  , maxSize               : bytesInfinity
  , minSize               : Bytes 0
  , className             : toNullable Nothing
  , activeClassName       : toNullable Nothing
  , acceptClassName       : toNullable Nothing
  , rejectClassName       : toNullable Nothing
  , disabledClassName     : toNullable Nothing
  , style                 : toNullable Nothing
  , activeStyle           : toNullable Nothing
  , acceptStyle           : toNullable Nothing
  , rejectStyle           : toNullable Nothing
  , disabledStyle         : toNullable Nothing
  , onClick               : toNullable Nothing
  , onDrop                : toNullable Nothing
  , onDropAccepted        : toNullable Nothing
  , onDropRejected        : toNullable Nothing
  , onDragStart           : toNullable Nothing
  , onDragEnter           : toNullable Nothing
  , onDragOver            : toNullable Nothing
  , onDragLeave           : toNullable Nothing
  , onFileDialogCancel    : toNullable Nothing
  }

  -- Default props from "react-dropzone":
  {-
    preventDropOnDocument: true
    disabled: false
    disablePreview: false
    disableClick: false
    multiple: true
    maxSize: Infinity
    minSize: 0
  -}


foreign import dropzone
  :: forall props inputProps
            style activeStyle acceptStyle rejectStyle disabledStyle
   . ReactClass ( Props ( children :: Children | props )
                        inputProps
                        style
                        activeStyle
                        acceptStyle
                        rejectStyle
                        disabledStyle )
