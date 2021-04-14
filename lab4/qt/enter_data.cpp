#include "enter_data.h"
#include <QVBoxLayout>

EnterData::EnterData(QWidget* parent) :
	QWidget(parent),
	label(new QLabel(this)),
	line_edit(new QLineEdit(this))
{
	QVBoxLayout* layout = new QVBoxLayout(this);
	layout->addWidget(label);
	layout->addWidget(line_edit);
	setLayout(layout);

	connect(line_edit, &QLineEdit::returnPressed,
			this, &EnterData::ReturnPressedText);
}

void EnterData::SetText(const QString& text) {
	label->setText(text);
}

void EnterData::ReturnPressedText() {
 	// qstring to std::string
	emit ReturnPressed(line_edit->text().toUtf8().constData());
}

