#include "mainwindow.h"

#include <QDebug>
#include <QAction>
#include <QSet>
#include <QStatusBar>
#include <QPushButton>

#include <iostream>

#include <fstream>

MainWindow::MainWindow(QWidget* parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	tree_widget = new TreeWidget;
	permanent_label = new QLabel;

	new_path = new EnterData;
	new_path->SetText("Enter new path");
	connect(new_path, &EnterData::ReturnPressed,
			tree_widget, &TreeWidget::AddPath);

	save_file = new EnterData;
	save_file->SetText("Enter name file to save");
	connect(save_file, &EnterData::ReturnPressed,
			this, &MainWindow::SaveToFile);

	upload_file = new EnterData;
	upload_file->SetText("Enter name file to upload");
	connect(upload_file, &EnterData::ReturnPressed,
			this, &MainWindow::UploadFromFile);

	ui->setupUi(this);
	mdi_area = ui->mdiArea;
	
	QPushButton* save_button = new QPushButton;
	save_button->setText("Save");
	QPushButton* load_button = new QPushButton;
	load_button->setText("Upload");
	QPushButton* add_button = new QPushButton;
	add_button->setText("Add");
	ui->toolBar->addWidget(save_button);
	ui->toolBar->addWidget(load_button);
	ui->toolBar->addWidget(add_button);

	
	InitNewSubWindow(ui->actionPathes, add_button, tree_widget);
	InitNewSubWindow(ui->actionSave, save_button, save_file, true);
	InitNewSubWindow(ui->actionUpload, load_button, upload_file, true);
	InitNewSubWindow(ui->actionAdd, add_button, new_path, true);

	ui->statusbar->addPermanentWidget(permanent_label);
	permanent_label->setNum(0);
	connect(tree_widget, SIGNAL(PathAdded(int)),
			permanent_label, SLOT(setNum(int)));
	connect(tree_widget, SIGNAL(SelectionChanged(const QString&)),
			ui->statusbar, SLOT(showMessage(const QString&)));
}

MainWindow::~MainWindow() {
	delete ui;
}

void MainWindow::InitNewSubWindow(QAction* show_action, 
	   QPushButton* tool_button, QWidget* internal_widget, bool is_hidden) 
{
	QMdiSubWindow* mdi_win = new QMdiSubWindow(mdi_area, Qt::Window);
	mdi_win->setWidget(internal_widget);
	mdi_area->addSubWindow(mdi_win);
	if (is_hidden) {
		mdi_win->hide();
	}

	connect(show_action, &QAction::triggered, 
			mdi_win, &QWidget::show);
	connect(show_action, &QAction::triggered, 
			internal_widget, &QWidget::show);
	connect(tool_button, &QPushButton::pressed, 
			mdi_win, &QWidget::show);
	connect(tool_button, &QPushButton::pressed, 
			internal_widget, &QWidget::show);
}

void MainWindow::SaveToFile(const std::string& file_name) {
	std::ofstream fout(file_name);
	auto data_set = tree_widget->GetDataSet();
	for (auto& elem : data_set) {
		std::string data = elem.toUtf8().constData();
		fout << data;
		fout << '\n';
	}

	fout.close();
}

void MainWindow::UploadFromFile(const std::string& file_name) {
	std::ifstream fin(file_name);
	if (!fin.is_open()) {
		return;
	}
	tree_widget->Clear();
	std::string data;
	while (fin) {
		std::getline(fin, data);
		tree_widget->AddPath(data);
	}

	fin.close();
}

