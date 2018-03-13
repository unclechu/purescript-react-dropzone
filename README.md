# purescript-react-dropzone

[PureScript][purescript] FFI bindings for ["react-dropzone"][dropzone] package.

It's work in progress, not published on [pursuit][pursuit] yet,
but it's working, I have used it in production.
For now you can dirty copy-paste it or use as [git-submodule][submodule].

## Requirements

- [purescript-prelude][purescript-prelude]
- [purescript-nullable][purescript-nullable]
- [purescript-maybe][purescript-maybe]
- [purescript-dom][purescript-dom]
- [purescript-react][purescript-react]

## Usage example

Keep in mind that this example requires [purescript-react-spaces][purescript-react-spaces].

```purescript
dropzone ^^ dropzoneDefaultProps
  { multiple = false
  , accept   = toNullable $ Just "image/jpeg, image/png"

  , onDropAccepted = toNullable $ Just $ handle2 $
      \files _ -> case head files of
                       Nothing -> pure unit
                       Just x  -> onFileDropped x

  , onDropRejected = toNullable $ Just $ handle2 $
      \files _ -> onFilesRejected files
  }
  $ do
    p $ text "Try dropping some files here, or click to select files to upload."
    p $ text "Only *.jpeg and *.png images will be accepted."
```

## Author

[Viacheslav Lotsmanov](https://github.com/unclechu)

## License

[MIT](LICENSE)

[purescript]: http://www.purescript.org
[pursuit]: https://pursuit.purescript.org
[dropzone]: https://github.com/react-dropzone/react-dropzone
[submodule]: https://www.git-scm.com/docs/gitsubmodules

[purescript-prelude]: https://pursuit.purescript.org/packages/purescript-prelude/3.1.0
[purescript-maybe]: https://pursuit.purescript.org/packages/purescript-maybe/3.0.0
[purescript-nullable]: https://pursuit.purescript.org/packages/purescript-nullable/3.0.0
[purescript-dom]: https://pursuit.purescript.org/packages/purescript-dom/4.15.0
[purescript-react]: https://pursuit.purescript.org/packages/purescript-react/5.1.0
[purescript-react-spaces]: https://pursuit.purescript.org/packages/purescript-react-spaces/1.0.1
