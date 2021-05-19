#include "main_window.h"
#include <QClipboard>
#include <QDragEnterEvent>
#include <QDropEvent>
#include <QMimeData>

MainWindow::MainWindow(QWidget* parent) :
	QMainWindow(parent),
	clipboard(QGuiApplication::clipboard())
{
	setAcceptDrops(true);
	ui.setupUi(this);
	ui.statusbar->
	showMessage("Перетащите картинку в окно (в буфер обмена)");
	ui.clipboard_text->setWordWrap(true);
	UpdateLabels();

	connect(clipboard, &QClipboard::dataChanged,
			this, &MainWindow::UpdateLabels);
	connect(ui.pushButton, &QPushButton::clicked,
			this, &MainWindow::SetTextToClipBoard);
}

void MainWindow::UpdateLabels() {
	pixmap = QPixmap::fromImage(clipboard->image());
	UpdateClipImage();
	ui.clipboard_text->setText(clipboard->text());
}

void MainWindow::resizeEvent(QResizeEvent* event) {
	QWidget::resizeEvent(event);
	UpdateClipImage();
}

void MainWindow::UpdateClipImage() {
	if (ui.clipboard_image->width() < ui.clipboard_image->height()) {
		ui.clipboard_image->
		setPixmap(pixmap.scaledToWidth(ui.clipboard_image->width()));
	} else {
		ui.clipboard_image->
		setPixmap(pixmap.scaledToHeight(ui.clipboard_image->height()));
	}
}

void MainWindow::SetTextToClipBoard() {
	clipboard->setText(ui.textEdit->toPlainText());
}


void MainWindow::dragEnterEvent(QDragEnterEvent* event) {
	event->acceptProposedAction();
}

void MainWindow::dropEvent(QDropEvent* event) {
	const QMimeData* mem = event->mimeData();
	if (mem->hasUrls()) {
		clipboard->setImage(QImage(mem->urls()[0].toLocalFile()));
	}
	UpdateLabels();
}

