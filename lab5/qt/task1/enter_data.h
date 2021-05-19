#ifndef LAB4_ENTER_DATA_H_
#define LAB4_ENTER_DATA_H_

#include <QWidget>
#include <QLabel>
#include <QLineEdit>

class EnterData : public QWidget {
	Q_OBJECT
private:
	QLabel* label;
	QLineEdit* line_edit;
public:
	EnterData(QWidget* parent = nullptr);
	void SetText(const QString& text);
private slots:
	void ReturnPressedText();
signals:
	void ReturnPressed(const std::string& text);
};

#endif

