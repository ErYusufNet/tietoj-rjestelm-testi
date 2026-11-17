# tietoj-rjestelm-testi

## OrangeHRM UI Automation

UI functional automation for the OrangeHRM public demo, built with Robot Framework and SeleniumLibrary.

## Scope

- Login, invalid login, required-field validation, and logout
- PIM employee creation and required-field validation
- Leave Management scenarios are planned and will be added after the PIM suite

## Project structure

```text
resources/pages/   Page Object resources and reusable page keywords
tests/             Robot Framework test suites
```

## Prerequisites

- Python 3.12 or compatible
- Google Chrome
- Internet access to the OrangeHRM demo

## Setup (Windows PowerShell)

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
```

## Run tests

Run all current suites:

```powershell
robot tests
```

Run one test by its test-case tag:

```powershell
robot --include TC-003 tests/login_tests.robot
robot --include TC-005 tests/pim_tests.robot
```

Robot Framework writes `output.xml`, `log.html`, and `report.html` in the current directory. These generated files and screenshots are excluded from Git.

## Test data

The project uses dummy QA employee data. The employee name includes a generated suffix to avoid collisions in the shared demo environment. The automation verifies the employee name fields after saving.

The public demo is shared and may be reset or unavailable. Test results should only be recorded after the corresponding test has actually run and its expected result has been verified.
