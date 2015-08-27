import QtQuick 2.0
import Ubuntu.Components 1.1
import "getthedata.js" as Getit
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "astros.aegloszenit"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)
    backgroundColor: "#333333"
    //headerColor: "#AEA79F"
    //backgroundColor:"#E77E5A"

    //footerColor: "#6B4C61"
    property string theSource: ""
    Page {
        title: i18n.tr("Astros")

        Flickable {
            id: theFlickable
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: apodimage.height + theapodtext.height + theapodtext.anchors.margins

            Component.onCompleted: {
                theSource = Getit.getData()
            }

                       Image {
                           id: apodimage
                           anchors.top: parent.top
                           //width: parent.width
                           anchors.left: parent.left
                           anchors.right: parent.right
                           fillMode: Image.PreserveAspectFit

                       }
                       Text {
                           id: theapodtext
                           anchors.left: parent.left
                           anchors.right: parent.right
                           anchors.top: apodimage.bottom
                           anchors.margins: 2
                           wrapMode: Text.WordWrap
                           color: "#FFFFFF"
                       }







        }
    }
}
